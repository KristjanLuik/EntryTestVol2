class QuestionsUnconfirmedByDefault < ActiveRecord::Migration
    def up
    change_column :answers, :status, :boolean, :default => false
end

def down
    change_column :answers, :status, :boolean, :default  => nil
end
end
