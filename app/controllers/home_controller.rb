class HomeController < ApplicationController
  before_filter :require_auth
  
  
  def index
    #@user = User.find(params[:auth_token])
    
  end
  
  
  
end
