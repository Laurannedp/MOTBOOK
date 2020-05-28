class TaskPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end
  def check?
    record.mot.user == user
  end
  def create?
    record.mot.user == user
  end
  def update?
    record.mot.user == user
  end
  def destroy?
    record.mot.user == user
  end
end
