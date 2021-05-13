class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    
    has_many :solutions
    has_many :products, through: :solutions

    has_secure_password

end
