class CreateDimCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :dim_customers do |t|
    
      t.date :creation_date
      t.string :company_name
      t.string :contact_name
      t.string :contact_email
      t.integer :nb_elevators
      t.string :contact_city
    end
  end
end
