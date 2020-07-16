class Inquiry < ApplicationRecord
  belongs_to :user, optional: true
  enum status:{ new: 0, working: 1, done: 9}
end
