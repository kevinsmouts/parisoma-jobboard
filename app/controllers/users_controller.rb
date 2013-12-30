class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:create, :new]

  before_filter :create_company, :only => :create
  load_and_authorize_resource
  def new
    @company = Company.new
  end
  
  def create
      o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
      string  =  (0...50).map{ o[rand(o.length)] }.join
      @user.confirmed = false
      @user.confirmation_code = string
      @user.company_id = @company.id
        if @user.save
          NotificationsMailer.email_confirmation(@user).deliver
          redirect_to account_confirmation_path, :notice => "Registration successful, now you need to confirm your account."
        else
          @company.destroy
          render :action => 'new'
        end
      else
  end
  
  def account_confirmation
    if params[:confirmation_code]
      code = params[:confirmation_code]
      @confirmed_user = User.find(:all, :conditions =>{:confirmation_code => code})
      if @confirmed_user.count == 1 and code != "0"
        @confirmed_user = @confirmed_user.first
        @confirmed_user.update_attributes(:confirmed => true, :confirmation_code => "0")
        NotificationsMailer.signup_confirmation(@confirmed_user).deliver
        redirect_to login_path, :notice => "Confirmation successful. Now you can log in."
      else
        redirect_to account_confirmation_path, :alert => "Wrong confirmation code."
      end
    else
      
    end
  end
  
  def testmail
    @user = current_user
    NotificationsMailer.email_confirmation(@user).deliver
  end

  def edit
  end
  
  def show
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to user_path(current_user), :notice  => "Your info has been successfully updated."
    else
      render :action => 'edit'
    end
  end
  
private
  
  def create_company
    @company = Company.new(params[:company])
    if @company.save
      
    else
      @user = User.new
      @user.email = params[:user][:email]
      render :action => 'new'
    end

  end
  
end
