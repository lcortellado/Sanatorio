class Ability
  include CanCan::Ability

  def initialize(user)
   user ||= User.new 
   if user.name == "admin"
      can :manage, :all 
      can :manage, :all
    else
      can :read, :all
      can :show, :all
    end

   
  end
end