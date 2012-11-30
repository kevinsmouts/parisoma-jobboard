class JobOffersController < ApplicationController
  before_filter :require_user, :only => [:new, :create, :edit, :update, :destroy]
 
  load_and_authorize_resource

 
  def index
  end

  def show
  end

  def new
  end

  def create
    @job_offer.company_id = current_user_company.id
    if @job_offer.save
      redirect_to @job_offer, :notice => "Successfully created job offer."
    else
      render :action => 'new'
    end
  end

  def edit
  end

  def update
    if @job_offer.update_attributes(params[:job_offer])
      redirect_to @job_offer, :notice  => "Successfully updated job offer."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @job_offer.destroy
    redirect_to job_offers_url, :notice => "Successfully destroyed job offer."
  end
  
  def field_filter
    @researched_field = params[:field_name]
    @job_offers = JobOffer.find(:all, :conditions => { :field_of_expertise => @researched_field })
    render :action => 'index'
  end
  
  def apply
    job_offer = JobOffer.find(params[:id])
    email = job_offer.contact_email
    redirect_to "mailto:"+email
  end
  
end
