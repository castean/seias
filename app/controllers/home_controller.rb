class HomeController < ApplicationController
  def index
    CanTango.debug_permits_registry
    CanTango.debug_ability(current_user, :read, CriticalSuccessFactor)

  end
end
