class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :content
      t.string :difficulty
      t.string :status

      t.timestamps
    end
  end
end
