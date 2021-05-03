class Solution < ApplicationRecord
    belongs_to :product
    belongs_to :user
    validates_presence_of :issue, :ingredient, :description
end
