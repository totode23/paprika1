class Setting < ApplicationRecord
    belongs_to :user
    validates :user_id, presence: true
    validates :inform, presence: true
    validates :inform_date, presence: true
    validates :inform_time, presence: true
    validates :green_date, presence: true
    validates :red_date, presence: true
end


