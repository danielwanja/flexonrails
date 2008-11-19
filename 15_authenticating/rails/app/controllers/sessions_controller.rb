# This controller handles the login/logout function of the site.  
class SessionsController < ApplicationController

  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      flash[:notice] = "Logged in successfully"
      success = true
    else
      success = false
    end
    
    respond_to do |format|
      format.html do
        if success
          redirect_back_or_default('/')
        else
          render :action => 'new'
        end
      end
      
      format.amf do
        if success
          render :amf => self.current_user
        else
          render :amf => FaultObject.new("Unable to log in: user doesn't exist or password is incorrect.")
        end
      end
    end
    
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    
    respond_to do |format|
      format.html do
        redirect_back_or_default('/')
      end
      format.amf { render :amf => nil }
    end
    
  end
end
