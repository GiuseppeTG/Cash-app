class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, :all
    can :manage, Group, user: user
    can :manage, Expense, user: user
    return unless user.role == 'admin'

    can :manage, :all
  end
end
