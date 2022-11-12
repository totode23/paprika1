class Inform < ApplicationRecord
    belongs_to :food
    validates :food_id, presence: true
end
