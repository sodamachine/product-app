class Product < ApplicationRecord

    validates :name, presence: true, uniqueness: true
    has_many :solutions
    accepts_nested_attributes_for :solutions

end