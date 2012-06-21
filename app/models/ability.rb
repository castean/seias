class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, :all
      can :create, UserSession
    else
      if user.has_role? :admin
        can :manage, :all
      elsif user.has_role? :user
        can :read, Activity
        can :create, Activity
        can :update, Activity do |acti|
          acti.try(:user) == user 
        end  
        can :destroy, Activity do |acti|
          acti.try(:user) == user 
        end     
      end   
    end
  end
end