class UserCompany < ApplicationRecord
  belongs_to :user
  belongs_to :company

  scope :invitation, -> {where(invitation: [true])}
  scope :participant, -> {where(invitation: [false])}
  scope :admin, -> {where(admin: [true])}

end
