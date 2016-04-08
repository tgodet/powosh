class Loan < ActiveRecord::Base
  belongs_to :book
  belongs_to :user

  scope :user_action_required, -> { where(pending: 'true') }
  scope :confirmed, -> { where(confirmed: 'true')}
end
