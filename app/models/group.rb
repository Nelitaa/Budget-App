class Group < ApplicationRecord
  has_many :group_movements, dependent: :destroy
  has_many :movements, through: :group_movements
  belongs_to :user, class_name: 'User', foreign_key: 'user_id'

  validates :name, presence: true
  validates :icon, presence: true
end
