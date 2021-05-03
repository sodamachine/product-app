class User < ApplicationRecord
    has_many :solutions
    has_many :products, through: :solutions
    has_secure_password

    validates_uniqueness_of :username
    validates_presence_of :username

end
