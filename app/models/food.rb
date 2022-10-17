class Food < ApplicationRecord
    belongs_to :user
    has_one_attached :photo
    validates :name, presence: true
    validates :user_id, presence: true
end
