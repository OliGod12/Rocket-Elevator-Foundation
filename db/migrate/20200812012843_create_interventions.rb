class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :Author, null: false
      t.integer :CustomerID, null: false
      t.integer :BuildingID, null: false
      t.integer :BatteryID
      t.integer :ColumnID
      t.integer :ElevatorID 
      t.integer :EmployeeID 
      t.datetime :start_of_intervention
      t.datetime :end_of_intervention
      t.string :Result, :default => 'Incomplete'
      t.string :Report
      t.string :Status, :default => 'Pending'
      t.timestamps
    end
  end
end