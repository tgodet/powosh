class LoanPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.involving_user(user.id)
    end
  end

  def create?
    !Book.of_friends(user.id).find(record.book_id).nil?
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
