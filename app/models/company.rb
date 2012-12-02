class Company < ActiveRecord::Base
  attr_accessible :name, :url, :description, :logo, :industry, :headquarters
  
  has_many :users  
  has_many :job_offers
  
  validates :name, presence: true
  validates_uniqueness_of :name


  def initial
       # find a number at the start of the string if it exists
       m = self.name.match(/^\d+/)
       return "123" if m
       # or return the first letter upcased otherwise
       return self.name.slice( 0, 1 ).upcase
     end

end
