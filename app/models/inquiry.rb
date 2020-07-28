class Inquiry < ApplicationRecord
  # belongs_to :user, optional: true, counter_cache: true
  belongs_to :facility, optional: true
  enum status: { not_started: 0, in_progress: 1, done: 9 }, _prefix: true
  enum kind: {inquiry: 0, new_facility:1, edit_facility:2}, _prefix: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :subject, length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 254 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :message, presence: true, length: { maximum: 1000 }

end
