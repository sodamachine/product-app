class Product < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    validates :brand, presence: true
    has_many :solutions
    accepts_nested_attributes_for :solutions

end