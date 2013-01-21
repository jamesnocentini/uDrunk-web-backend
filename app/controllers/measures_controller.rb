class MeasuresController < ApplicationController

  

  before_filter :require_auth
  
  def create
    #@user = User.find(params[:user_id])
    auth_token = request.headers["auth_token"]
    @user = User.find_by_auth_token(auth_token)
    
    @measure = @user.measures.create(:reading => params[:reading])
   
      #redirect_to 'user#show', :notice => "Logged in!"
      #redirect_to user_path(@user)
      if @measure.save
        render :json => {
          :success => true,
          :measure => @measure
        }
        
        else
          render :json => {
            :success => false,
            :errors => @measure.errors
          }
 
  end
  
  end
  
end
  



  

