class Flashcard < ApplicationRecord
    belongs_to :user
    has_many :flashcard_subjects
    has_many :subjects, through: :flashcard_subjects

    accepts_nested_attributes_for :flashcard_subjects
    

    validates :question, presence: true
    validates :answer, presence: true

    scope :public_card, -> { where(status: true) }
end
