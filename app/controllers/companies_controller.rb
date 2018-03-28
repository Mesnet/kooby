class CompaniesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_company, except: [:create]

  def acc_invit
    @invitation = current_user.user_companies.invitation.where(company: @company).first
    # Secure Verification (the user has received an invitation from this company )
    unless @invitation == nil 
      @invitation.update(invitation: false)
      current_user.update(company: true)
      respond_to do |format|
        format.js
      end
    end
    # At this time others invitations are not deleted. But we can add it easily !
  end

  def create
    @company = Company.new(company_params)
    respond_to do |format|
      if @company.save
        UserCompany.create(company: @company, user: current_user, admin: true)
        current_user.update(company: true)
        format.js
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      params.require(:company).permit(:name)
    end
end
