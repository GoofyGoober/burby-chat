require 'obscenity/active_model'

class Message < ApplicationRecord
  belongs_to :user
  validates :user, presence: true
  validates :content, presence: true
  validates :content, uniqueness: {scope: :user}
  validates :content,  obscenity: { sanitize: true,  message: 'Burby ti vede'  }
  default_scope -> {includes(:user).order('created_at ASC')}
end