class AddDiffCountToTest < ActiveRecord::Migration
  def change
  	add_column :tests, :hard_count, :integer
    add_column :tests, :medium_count, :integer
    add_column :tests, :easy_count, :integer
  end
end
