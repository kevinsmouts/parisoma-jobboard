class JobOffer < ActiveRecord::Base  
  
  attr_accessible :title, :start_date, :open_until, :job_description, :qualifications, :field_of_expertise, :location, :contact_email, :company_id

  belongs_to :company
  accepts_nested_attributes_for :company
  validates :company_id, presence: true



end
