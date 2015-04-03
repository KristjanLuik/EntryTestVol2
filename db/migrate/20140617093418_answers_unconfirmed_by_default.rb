class AnswersUnconfirmedByDefault < ActiveRecord::Migration
  def up
    change_column :questions, :status, :boolean, :default => false
  end


  def down
      change_column :questions, :status, :boolean, :default  => nil
  end
end
