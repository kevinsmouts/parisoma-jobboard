class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new  #guest user
    
    # if user.role? :admin
    #   can :manage, :all
    # else
      can :read, :all
      can [:field_filter, :apply], JobOffer
      can :create, User
      can :create, Company do |company|
        user.company_id.to_i == nil
      end
      can :create, JobOffer
      can [:update, :destroy], JobOffer do |job_offer|
        job_offer.company_id == user.try(:company_id).to_i
      end
      can [:update, :destroy], Company do |company|
        company.id == user.company_id.to_i
      end
      
      can [:update, :destroy], User do |target|
        target.id == user.id
      end
    end
end
