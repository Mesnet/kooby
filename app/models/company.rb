class Company < ApplicationRecord
  validates :name, presence: true
  has_many :user_companies, dependent: :destroy
  has_many :users, through: :user_companies
end
