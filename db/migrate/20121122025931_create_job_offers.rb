class CreateJobOffers < ActiveRecord::Migration
  def self.up
    create_table :job_offers do |t|
      t.string :title
      t.date :start_date
      t.date :open_until
      t.text :job_description
      t.text :qualifications
      t.string :field_of_expertise
      t.string :location
      t.string :contact_email
      t.integer :company_id
      t.timestamps
    end
    add_index :job_offers, [:company_id]
  end

  def self.down
    drop_table :job_offers
  end
end
