class Ability
  include CanCan::Ability

  def initialize(user)
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :user
      can :read, :all
      can :create, Activity
      can :update, Activity do |acti|
        acti.try(:user) == user 
      end  
      can :destroy, Activity do |acti|
        acti.try(:user) == user 
      end     
    else
      can :read, :all
    end    
  end
end