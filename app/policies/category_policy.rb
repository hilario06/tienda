class CategoryPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def initialize(user, scope)
    #   @user  = user
    #   @scope = scope
    # end

    def resolve
      scope.all
    end
  end

  def index?
    user.admin?
  end
end
