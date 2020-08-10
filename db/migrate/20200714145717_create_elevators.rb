class CreateElevators < ActiveRecord::Migration[5.2]
  def self.up
    create_table :elevators do |t|
      t.bigint :serial_number
      t.string :model
      t.string :elevator_type
      t.string :status
      t.date :commission_date
      t.date :date_of_last_inspection
      t.string :certificate_of_inspection
      t.text :informations
      t.text :notes
      t.references :column, foreign_key: true
      t.timestamps
    end
  end
end
