class Ability
  include CanCan::Ability

  def initialize(user)
     user ||= User.new # guest user (not logged in)
     if user.admin?
       can :manage, :all
       can [:update, :destroy], :all, :user_id => user.id
     else
       can [:read, :create], :all
       can [:update, :destroy], :all, :user_id => user.id
     end
  end
end
