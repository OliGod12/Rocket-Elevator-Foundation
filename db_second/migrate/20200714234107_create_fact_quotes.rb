class CreateFactQuotes < ActiveRecord::Migration[5.2]
  def change
    create_table :fact_quotes do |t|


      t.integer :quote_id
      t.datetime :creation_date
      t.string :company_name
      t.string :email
      t.integer :nb_elevator
      

      
    end
  end
end
