class User < ApplicationRecord
  has_one_attached :avatar

  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, confirmation: true

  belongs_to :coach, optional: true
  belongs_to :program, optional: true
  has_many :users_techniques
  has_many :techniques, through: :users_techniques
  has_many :users_techniques_ratings
  has_many :users_coaches_invitations
  has_many :user_completed_steps
  has_many :steps, through: :user_completed_steps
  has_many :messages, dependent: :destroy
end
