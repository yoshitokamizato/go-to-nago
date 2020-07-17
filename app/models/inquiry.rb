class Inquiry < ApplicationRecord
  # belongs_to :user, optional: true, counter_cache: true
  enum status:{ not_started: 0, working: 1, done: 9}

  validates :name, presence: true
  validates :email, presence: true
  # validates :subject, presence: true
  validates :message, presence: true

  # validates_acceptance_of :confirming
  # after_validation :check_confirming

  # def check_confirming
  #   errors.delete(:confirming)
  #   self.confirming = errors.empty? ? '1' : ''
  # end
end
