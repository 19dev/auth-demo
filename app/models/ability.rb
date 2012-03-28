class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)

    if user.role? :geek or user.role? :guest
      can :read, Post
    end

    if user.role? :moderator
      can [:read, :create], Post
    end

    if user.role? :admin
      can [:read, :create, :update], Post
    end

    if user.role? :superadmin
      can :manage, Post
    end
  end
end
