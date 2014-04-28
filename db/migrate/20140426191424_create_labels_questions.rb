class CreateLabelsQuestions < ActiveRecord::Migration
  def change
    create_table :labels_questions do |t|
      t.integer :question_id
      t.integer :label_id

      t.timestamps
    end
  end
end
