class CreateAttemptAnswers < ActiveRecord::Migration
  def change
    create_table :attempt_answers do |t|
      t.integer :answer_id
      t.integer :attempt_id
      t.boolean :chosen

      t.timestamps
    end
  end
end
