class Ability
  include CanCan::Ability

  def initialize(user)   
    if user.nil?
      can :read, :all
      can :create, UserSession
      #puts "Usuario Nulo"
    else

      can :read, :all
      can :for_countyid, Town
      can :for_directionid, Department
      can :for_activitytypeid, Activity
      can :for_departmentid, Activity
      can :destroy, UserSession 
      can :change_password, User
      can :download_manual, Home
      # Basically if/elsif/else (notice there's nothing
      # after the word "case"):
           
      case user.roles.to_s 
      when "admin" then
        10.times { print "Hello admin" }
        can :manage, :all
      when "planeacion" then
         10.times { print "Hello planeacion" }
        can :manage, PriorityProgram
        can :manage, PriorityProgramGoal
        can :manage, PriorityProgramStrategy
        can :manage, PriorityProgramActionLine
        can :manage, Ped
        can :manage, PedSubTheme
        can :manage, PedGoal
        can :manage, PedStrategy
        can :manage, PedActionLine
        can :manage, Program
        can :manage, CriticalSuccessFactor
        can :manage, CriticalSuccessFactorType
        can :manage, ActivityType
        can :create, Activity
        can :update, Activity do |acti|
          acti.try(:user) == user 
        end  
        can :destroy, Activity do |acti|
          acti.try(:user) == user 
        end
      when "user" then
        can :create, Activity
        can :update, Activity do |acti|
          acti.try(:user) == user 
        end  
        can :destroy, Activity do |acti|
          acti.try(:user) == user 
        end
      end

      # If you assigned 'variable =' before the case,
      # the variable now has the value of the
      # last-executed statement--or nil if there was
      # no match.  variable=if/elsif/else does this too.      
  
    end
  end
end