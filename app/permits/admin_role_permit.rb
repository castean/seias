class AdminRolePermit < CanTango::RolePermit
  def initialize ability
    super
  end

  protected

  def permit_rules
    # insert your can, cannot and any other rule statements here
    can(:manage, :all)
    can :read, CriticalSuccessFactor
     # use any licenses here
  end

  module Cached
    def permit_rules
      can(:manage, :all)
      can :read, CriticalSuccessFactor
    end
  end

  module NonCached
    def permit_rules
      can(:manage, :all)
      can :read, CriticalSuccessFactor
    end
  end
end
