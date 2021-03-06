class Activity < ApplicationRecord
    has_many :choice_activities, dependent: :destroy
    has_many :choices, through: :choice_activities
    ARR = ["food", "movie", "restaurant"]

    validates :name, :genre_cuisine, presence: true
    validates :category, inclusion: {in: ARR}
end
