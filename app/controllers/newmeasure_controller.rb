class NewmeasureController < ApplicationController
  
  before_filter :require_auth
  
  def create_mobile
    
    @user = User.find(params[:id])
    #@measur = Measure.new(params[:measure])
    #@measure = @user.measure
    #@measure = @user.measures.create.login(params[:measure])
   
   #@measure = Measure.new(params[:measure])
   @measure = @user.measures.create!(params[:measure])
   
      
      render :status => 200, :json => {
        :username => @user.username,
        :email => @user.email,
        :auth_token => @user.auth_token,
        :auth_token_expires_at => @user.auth_token_expires_at
      }
      
      else
        render :status => 422, :json => {:error => "Invalid credentials"}
      end
      
end
