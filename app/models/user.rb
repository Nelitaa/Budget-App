class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :confirmable
  has_many :groups, class_name: 'Group', dependent: :destroy, foreign_key: 'user_id'
  has_many :movements, class_name: 'Movement', dependent: :destroy, foreign_key: 'user_id'

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true
end
