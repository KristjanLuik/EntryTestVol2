class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.integer :personal_id
      t.string :email
      t.integer :phone_number
      t.string :city
      t.string :country
      t.string :gender
      t.string :address
      t.integer :role_id
      t.string :password

      t.timestamps
    end
  end
end
