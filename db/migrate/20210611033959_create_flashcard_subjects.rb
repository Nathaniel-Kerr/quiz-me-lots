class CreateFlashcardSubjects < ActiveRecord::Migration[6.1]
  def change
    create_table :flashcard_subjects do |t|
      t.integer :flashcard_id
      t.integer :subject_id

      t.timestamps
    end
  end
end
