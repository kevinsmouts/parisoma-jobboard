class CreateCompanies < ActiveRecord::Migration
  def self.up
    create_table :companies do |t|
      t.string :name
      t.string :url
      t.string :description
      t.string :logo
      t.string :industry
      t.string :headquarters_street
      t.string :headquarters_city
      t.string :headquarters_zipcode
      t.string :headquarters_state
      t.string :headquarters_country
      t.timestamps
    end
  end

  def self.down
    drop_table :companies
  end
end
