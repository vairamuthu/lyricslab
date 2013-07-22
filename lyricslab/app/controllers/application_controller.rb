class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
   before_filter :authenticate_user!
  
  protect_from_forgery
  
  #def authenticate_user!
  #  if !current_user
  #    # This should work, but session is lost. See https://github.com/plataformatec/devise/issues/1357
  #    # session[:return_to] = request.fullpath
  #    redirect_to user_omniauth_authorize_path(:facebook, :origin => request.fullpath)
  #  end
  #end   

  def after_sign_in_path_for(resource)
    # This should work, but session is lost. See https://github.com/plataformatec/devise/issues/1357
    # return_to = session[:return_to]
    # session[:return_to] = nil
    return_to = request.env['omniauth.origin']
    stored_location_for(resource) || return_to || root_path  
  end
  
end
