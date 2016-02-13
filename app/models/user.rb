class User < ApplicationRecord
  has_many :messages
  validates :name, presence: true
  validates :name,  obscenity: { sanitize: true,  message: 'Burby ti vede'  }
end
