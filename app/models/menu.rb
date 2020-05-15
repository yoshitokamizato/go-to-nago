class Menu < ApplicationRecord
  belongs_to :facility, optional: true
end
