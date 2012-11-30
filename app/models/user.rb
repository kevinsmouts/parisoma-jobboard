class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :company_id
  acts_as_authentic
  
  belongs_to :company
  accepts_nested_attributes_for :company
  validates :company_id, presence: true
end
