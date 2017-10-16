class User < ApplicationRecord
  has_many :entries

  validates :username, { presence: true,
                         uniqueness: true }
  validates :email, { presence: true }

  has_secure_password
  validates :password, { presence: true,
                         length: { minimum: 6 } }

  # paginates_per 30
  # max_paginates_per 100
end
