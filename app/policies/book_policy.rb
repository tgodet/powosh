class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.of_friends(user.id)
    end
  end

  def update?
    record.user == user
  end
end
