class Subject < ApplicationRecord
    has_many :flashcard_subjects
    has_many :flashcards, through: :flashcard_subjects

    validates :name, presence: true
    validates :name, uniqueness: { case_sensitive: false }
end
