class UserinfosController < ApplicationController

  def create
    @userinfo = Userinfo.new(userinfo_params)
    @name = @userinfo.name.humanize.rstrip
    @surname = @userinfo.surname.humanize.rstrip
    @initial = @name[0] + @surname[0]
    @pseudo = @userinfo.pseudo.humanize.rstrip
    @colors = ["#1B998B","#DB162F","#FFC61E","#00B760","#E0ED44","#003D6B","#AD8799","#007FCC", "#E5E059", "#BDD358", "#999799", "#E5625E","#083D77", "#DA4167", "#F78764", "#00F0B5", "#F61067", "#FBB13C", "#218380", "#FFD400", "#2589BD", "#187795","#38686A", "#BDD358", "#3E6990", "#381D2A", "#AABD8C"]
    respond_to do |format|
      if @userinfo.save
        current_user.update(name: @name, surname: @surname, pseudo: @pseudo, phone: @userinfo.phone, initial: @initial, color: @colors.sample)
        format.js
      end
    end
  end
  
  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def userinfo_params
      params.require(:userinfo).permit(:name, :surname, :pseudo, :phone)
    end
end
