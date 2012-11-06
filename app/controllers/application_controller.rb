class ApplicationController < ActionController::Base
  protect_from_forgery
  
  protected
  
  def require_sudo
    require 'digest'
    
    authenticate_or_request_with_http_basic do |username, password|
      # Return true if the username and password is correct.
      username == 'admin' &&
      Digest::SHA1.hexdigest('384'+password) == '37c9f2298c5f7841b60b50e7604c58a5f968a7d4'
      # Here we have a salted SHA1 password being used. Please note that it is not
      # a good practice to have a password hardcoded in your source, even if it is hashsed.
      # FYI: The password is dragonfruit.
    end
  end
end
