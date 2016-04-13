class LoanPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.involving_user(user.id)
    end
  end

  def new?
    owner?
  end

  def create?
    owner?
  end

  def request_book?
    !Book.of_friends(user).find(record.book_id).nil?
  end

  def lend_book?
    owner?
  end

  def reject_loan?
    owner?
  end

  def return_book?
    owner? || borrower?
  end

  def close_pending?
    record.action_owner
  end

  def owner?
    record.book.user == user
  end

  def borrower?
    record.user == user
  end

end
