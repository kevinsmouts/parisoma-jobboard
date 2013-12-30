class Ability
  include CanCan::Ability
  
  def initialize(user)
    user ||= User.new  #guest user
    
    # if user.role? :admin
    #   can :manage, :all
    # else
      can [:field_filter, :apply, :home], JobOffer
      can [:create, :account_confirmation], User
      can :create, Company do |company|
        user.company_id.to_i == nil
      end
      can [:read, :create], JobOffer
      can [:read], Company
      can [:update, :destroy], JobOffer do |job_offer|
        job_offer.company_id == user.try(:company_id).to_i
      end
      can :update, Company do |company|
        company.id == user.company_id.to_i
      end
      
      can [:read, :update, :testmail], User do |target|
        target.id == user.id
      end
    end
end
