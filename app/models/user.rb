class User < ApplicationRecord
    has_many :solutions
    has_many :products, through: :solutions
    has_secure_password
end
