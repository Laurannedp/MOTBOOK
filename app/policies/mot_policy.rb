class MotPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where( user: user)
    end
  end
  def new?
    true
  end
  def create?
    record.user == user
  end
  def show?
    record.user == user
  end
  def update?
    record.user == user
  end
  def destroy?
    record.user == user
  end
end
