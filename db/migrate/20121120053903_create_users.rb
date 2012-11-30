class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :email
      t.string :crypted_password
      t.string :password_salt
      t.string :persistence_token
      t.string :company_id
      t.string :confirmation_code
      t.boolean :confirmed
      t.timestamps
    end
    add_index :users, [:company_id]
  end

  def self.down
    drop_table :users
  end
end
