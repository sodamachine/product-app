class User < ApplicationRecord
    has_many :solutions
    has_many :products, through: :solutions
    has_secure_password

    validates :username, presence: true, uniqueness: true

end
