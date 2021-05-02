class Solution < ApplicationRecord
    belongs_to :product
    validates_presence_of :ingredient, :description
end
