class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all #sichtbar fuer alle(auch nicht)
      scope.where(user: user)
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def update?
    user = record.user
  end

end
