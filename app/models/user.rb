class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

  has_many :user_companies, dependent: :destroy
  has_many :companies, through: :user_companies

  def company_invit
    self.user_companies.invitation
  end

  def company
    self.user_companies.participant.first
  end

end