class CreateAddresses < ActiveRecord::Migration[5.2]
  def self.up
    create_table :addresses do |t|
      t.decimal :latitude, :precision=>20, :scale=>8
      t.decimal :longitude, :precision=>20, :scale=>8
      t.string :type_of_address
      t.string :status
      t.string :entity
      t.string :number_and_street
      t.string :suite_or_apartment, :default => ""
      t.string :city
      t.string :state
      t.string :postal_code
      t.string :country
      t.text :notes
      t.timestamps
    end
  end
end
