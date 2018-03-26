class PagesController < ApplicationController
  def home
    if current_user.company_id.nil?
      redirect_to new_company_path
    end
  end

  def landing
  end
end
