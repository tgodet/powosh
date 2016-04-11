class Loan < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  scope :requested, -> { where(status: 'requested')}
  scope :confirmed, -> { where(status: 'approved')}
  scope :pending, -> { where(pending: 'true') }
  scope :closed, -> { where(status: 'closed') }

  def self.user_action(user_id)
    Loan.pending.where(action_owner: user_id)
  end

  def self.friend_action(user_id)
    Loan.pending.where(user_id: user_id)
  end

  def self.shared(user_id)
    Loan.joins("JOIN books ON books.id = loans.book_id").where("books.user_id = '#{user_id}'").confirmed
  end

    def self.of_friends(user_id)
    Book.joins(user: :friendships).where("friendships.friend_id = '#{user_id}'")
  end

  def self.borrowed(user_id)
    Loan.confirmed.where(user_id: user_id)
  end

  def self.returns(user_id)
    Loan.user_action(user_id).pending.closed
  end
end
