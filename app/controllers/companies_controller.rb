class CompaniesController < ApplicationController
  before_filter :require_user, :only => [:edit, :update, :destroy]
  load_and_authorize_resource
  
  def index
  end

  def show
  end

  def new
  end

  def create
    if @company.save
      redirect_to root_url, :notice => "Successfully created company."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @company.update_attributes(params[:company])
      redirect_to @company, :notice  => "Your company profile has been successfully updated."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @company.destroy
    redirect_to companies_url, :notice => "Successfully destroyed company."
  end
end
