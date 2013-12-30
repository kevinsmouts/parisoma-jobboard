class UserSessionsController < ApplicationController
  before_filter :require_no_user, :except => :destroy
  
  def new
    @user_session = UserSession.new
  end

  def create
    user = User.find(:all, :conditions =>{:email => params[:user_session][:email]}).first
    if user
      if user.confirmed
        @user_session = UserSession.new(params[:user_session])
        if @user_session.save
          redirect_to root_url, :notice => "Successfully logged in."
        else
          render :action => 'new'
        end
      else
        redirect_to account_confirmation_path, :alert => "You need to confirm your account before logging in."
      end
    end
  end

  def destroy
    @user_session = UserSession.find
    @user_session.destroy
    redirect_to root_url, :notice => "Successfully logged out."
  end
end
