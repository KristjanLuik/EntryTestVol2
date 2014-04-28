class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :content
      t.integer :points
      t.string :status
      t.boolean :correct
      t.integer :question_id

      t.timestamps
    end
  end
end
