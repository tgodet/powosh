class Loan < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  scope :requested, -> { where(status: 'requested')}
  scope :given, -> { where(status: 'given')}
  scope :pending, -> { where(pending: 'true') }
  scope :returned, -> { where(status: 'returned') }

  validates :user_id, presence: true if :borrower.nil?
  validates :borrower_name_manual, presence: true if :user_id.empty?

  def self.user_action(user_id)
    Loan.pending.where(action_owner: user_id)
  end

  def self.friend_action(user_id)
    Loan.pending.where(user_id: user_id)
  end

  def self.shared(user_id)
    Loan.joins("JOIN books ON books.id = loans.book_id").where("books.user_id = '#{user_id}'").given
  end

    def self.of_friends(user)
    Book.joins(user: :friendships).where("friendships.friend_id = '#{user.id}'")
  end

  def self.borrowed(user_id)
    Loan.given.where(user_id: user_id)
  end

  def self.returns(user_id)
    Loan.user_action(user_id).pending.returned
  end

  def self.involving_user(user_id)
    Loan.joins(
      "JOIN books ON books.id = loans.book_id").where(
      "books.user_id = '#{user_id}' OR loans.user_id = '#{user_id}' ")
  end
end
