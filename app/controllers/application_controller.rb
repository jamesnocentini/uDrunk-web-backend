class ApplicationController < ActionController::Base
  def require_auth
    auth_token = request.headers["auth_token"]
    @user = User.find_by_auth_token(auth_token)
    #@measure = @user.measure
    if @user
      if @user.auth_token_expired?
        render :status => 401, :json => {:error => "Auth token expired"}
        return false
      end
    else
      render :status => 401, :json => {:error => "Requires authorization"}
      return false
    end
  end
end
