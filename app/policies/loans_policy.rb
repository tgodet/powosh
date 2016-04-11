class LoansPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.involving_user(user.id)
    end
  end
end
