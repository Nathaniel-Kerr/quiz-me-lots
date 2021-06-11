class CreateFlashcards < ActiveRecord::Migration[6.1]
  def change
    create_table :flashcards do |t|
      t.string :question
      t.text :answer
      t.integer :user_id

      t.timestamps
    end
  end
end
