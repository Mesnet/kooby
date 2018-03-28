class Userinfo < ApplicationRecord
  validates :name, presence: true
  validates :surname, presence: true
  validates :pseudo, presence: true
end
