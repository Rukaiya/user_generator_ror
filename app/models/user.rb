class User < ApplicationRecord
  validates_presence_of :first_name, :last_name
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: 'format is invalid' }
end
