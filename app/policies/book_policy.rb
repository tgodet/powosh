class BookPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.of_friends(user.id)
    end
  end

  def show?
    # can view friends books
    scope.where(:id => record.id).exists? || user.id == record.user_id
  end

  def create?
    true
  end

  def destroy?
    update?

    # could prevent deletion of books currently on loan, but maybe user wants
    # to give book away... haven't tested following code yet.
    #
    # unless update?
    #   return false
    # end
    # if Loan.where(book_id: record.id).exist?
    #   flash[:notice] = "You can't delete a book that's currently on loan."
    #   false
    # end
  end

  def update?
    record.user == user
  end
end
