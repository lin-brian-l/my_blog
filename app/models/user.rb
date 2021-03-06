class User < ApplicationRecord
  has_many :entries

  validates :username, { presence: true,
                         uniqueness: true }
  validates :email, { presence: true }

  has_secure_password
  validates :password, { presence: true,
                         length: { minimum: 6 } }
end
