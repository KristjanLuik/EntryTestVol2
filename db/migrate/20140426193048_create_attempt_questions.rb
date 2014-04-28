class CreateAttemptQuestions < ActiveRecord::Migration
  def change
    create_table :attempt_questions do |t|
      t.integer :question_id
      t.integer :attempt_id

      t.timestamps
    end
  end
end
