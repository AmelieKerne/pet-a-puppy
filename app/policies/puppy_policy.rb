class PuppyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    return true
    # this is halloween
  end

  def show?
    return true
  end

  def create?
    return true
  end

  def update?
    user = record.user
  end

  def destroy?
    user = record.user
  end

end
