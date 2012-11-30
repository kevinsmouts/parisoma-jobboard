module JobOffersHelper
  
  def company
    @company = Company.find(@job_offer.try(:company_id))
  end
  
  def parent_company(company_id)
    @parent_company = Company.find(company_id)
  end
  
  def future_start_date?
    current_time = Time.new
    if @job_offer.created_at <= current_time
      return false
    else
      return true
    end
  end
  
end
