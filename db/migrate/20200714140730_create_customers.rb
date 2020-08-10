class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.date :customer_create_date
      t.string :company_name
      t.string :full_name_company_contact
      t.string :company_contact_phone
      t.string :company_contact_email
      t.text :company_description
      t.string :full_name_STA
      t.string :phone_TA
      t.string :email_TA
      t.references :user, foreign_key: true
      t.references :address, foreign_key: true
      t.timestamps
    end
  end
end
