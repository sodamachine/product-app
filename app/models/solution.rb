class Solution < ApplicationRecord
    validates_presence_of :issue, :ingredient, :description
    
    belongs_to :product
    belongs_to :user

    #scope :issue_search, ->(i) {where(:issue => i.titlecase)}
    scope :issue_search, ->(i) {where("issue like?", "%#{i}%" )}

end
