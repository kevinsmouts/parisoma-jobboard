module UsersHelper

  def job_offers
   @job_offers = JobOffer.find(:all, :conditions => { :company_id => @user.company_id.to_s })
  end
  
  def company
    
    @company = Company.find(@user.company_id.to_s)
  end
  

end
