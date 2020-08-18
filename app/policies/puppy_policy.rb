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
end
