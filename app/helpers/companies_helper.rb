module CompaniesHelper
  def job_offers
    @job_offers = JobOffer.find(:all, :conditions => { :company_id => @company.id })
  end
end
