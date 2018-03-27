class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_back(options = {})
    if request.referer
      redirect_to request.referer, options
    else
      redirect_to root_path, options
    end
  end
  
end
