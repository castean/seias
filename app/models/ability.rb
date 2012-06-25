class Ability
  include CanCan::Ability

  def initialize(user)
    if user.nil?
      can :read, :all
      can :create, UserSession
      #puts "Usuario Nulo"
    else
      if user.role? :admin
        can :manage, :all
        #for i in 0..10
           #puts "Entro al Admin"
        #end        
      elsif user.role? :user
        #for i in 0..10
           #puts "Entro al User"
        #end          
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