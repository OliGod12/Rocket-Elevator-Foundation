class CreateBatteries < ActiveRecord::Migration[5.2]
  def self.up
    create_table :batteries do |t|
      t.string :battery_type
      t.string :status
      t.date :commission_date
      t.date :date_of_last_inspect
      t.string :certificate_of_operations
      t.text :informations
      t.text :notes
      t.references :building, foreign_key: true
      t.references :employee, foreign_key: true
      t.timestamps
    end
  end
end
