class Message < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :content, presence: true
  default_scope -> {includes(:user).order('created_at DESC')}
end