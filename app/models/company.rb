class Company < ActiveRecord::Base
  attr_accessible :name, :url, :description, :logo, :industry, :headquarters
  
  has_many :users  
  has_many :job_offers
  
  validates :name, presence: true
  validates_uniqueness_of :name
end
