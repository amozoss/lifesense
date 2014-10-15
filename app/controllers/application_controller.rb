class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def authenticate 
    authenticate_or_request_with_http_token do |token, options|
      @current_user = User.authenticate_with_token(token)
      return @current_user if @current_user && token == @current_user.token
    end
    # return a boolean, but still send unauthorized
    head :unauthorized
    return false 
  end

end
