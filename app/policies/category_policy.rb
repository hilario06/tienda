class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def initialize(user, scope)
    #   @user  = user
    #   @scope = scope
    # end

    def resolve
      # scope.all
      scope.with_deleted.order('id ASC')
    end
  end

  def index?
    user.admin?
  end

  def create?
    user.admin?
  end

  def update?
    user.admin?
  end

  def destroy?
    user.admin?
  end

  def restore?
    user.admin?
  end
end
