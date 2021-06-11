class FlashcardSubject < ApplicationRecord
    belongs_to :subject
    belongs_to :flashcard 
end
