class Solution < ApplicationRecord
    belongs_to :product
    belongs_to :user

    validates_presence_of :issue, :ingredient, :description

    scope(:issue_search, ->(issue) {self.where("issue.downcase = ?", issue)})
end
