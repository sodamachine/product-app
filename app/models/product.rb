class Product < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :brand, presence: true
    
    has_many :solutions
    has_many :users, through: :solutions

    accepts_nested_attributes_for :solutions

end