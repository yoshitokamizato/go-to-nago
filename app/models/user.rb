class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname, presence: true
  validates :birth_year, presence: true
  validates :prefecture, presence: true
  enum sex: {male: 0, female: 1, other: 2}
  enum role: {general: 0, owner: 1, admin: 2}
  enum status: {temporary: 0, active: 1, resign: 2}
end
