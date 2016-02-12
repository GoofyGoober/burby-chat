class Message < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :content, presence: true
  validates :content, uniqueness: {scope: :user}
  default_scope -> {includes(:user).order('created_at ASC')}
  check_profanity
end