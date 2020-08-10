class CreateFactElevator < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_elevators do |t|
      t.integer :building_id
      t.integer :customer_id
      t.bigint :serial_number
      t.date :commissioning_date

      t.string :building_city

    end
  end
end
