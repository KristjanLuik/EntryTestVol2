class AddAnswerLimitsToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :max_options, :integer
    add_column :questions, :min_options, :integer
    add_column :questions, :max_correct, :integer
    add_column :questions, :min_correct, :integer
  end
end
