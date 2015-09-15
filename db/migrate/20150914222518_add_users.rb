class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.string :first_name
      t.string :last_name
      t.datetime :created_at
      t.datetime :updated_at
    end
  end
end
