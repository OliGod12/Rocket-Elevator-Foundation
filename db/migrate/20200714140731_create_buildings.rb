class CreateBuildings < ActiveRecord::Migration[5.2]
  def change
    create_table :buildings do |t|
      t.string :admin_full_name
      t.string :admin_phone
      t.string :admin_email
      t.string :full_name_STA
      t.string :phone_TA
      t.string :email_TA
      t.references :address, foreign_key: true
      t.references :customer, foreign_key: true
      t.timestamps
    end
  end
end
