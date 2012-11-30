class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:create, :new]

  before_filter :create_company, :only => :create
  load_and_authorize_resource
  def new
    @company = Company.new
  end
  
  def create
    @user.company_id = @company.id
      if @user.save
        redirect_to root_url, :notice => "Registration successful."
      else
        @company.destroy
        render :action => 'new'
      end
    else
  end

  def edit
  end
  
  def show
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to root_url, :notice  => "Successfully updated user."
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
