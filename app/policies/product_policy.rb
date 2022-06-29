class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def create?
    # user.admin es igual user.admin?
    user.admin?
  end

  def show?
    true
  end

  def update?
    user.admin
  end

  def destroy?
    user.admin
  end
end
