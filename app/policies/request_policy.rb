class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    !user.nil?
  end

  def create?
    new?
  end

  def continue_request?
    record.client == user
  end
end
