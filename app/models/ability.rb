# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
      user ||= User.new # guest user (not logged in)
    #ユーザーの役職に応じた権限管理
    # 管理者(1)の場合
    if user.admin?
        #自由自在
        can :manage, :all
    #デベロッパ(3)の場合
    elsif user.developer?
        # パッケージとバージョンのCRUDを許可
        can :read, Package
        can :create, Package
        can :update, Package
        can :destroy, Package
        can :read, Version
        can :create, Version
        can :destroy, Version
        can :update, Version
    #ただの人(2)の場合
    else
        can :read, Package
        can :read, Version
    end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
