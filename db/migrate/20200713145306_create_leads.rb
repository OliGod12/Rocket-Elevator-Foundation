class CreateLeads < ActiveRecord::Migration[5.2]
  def change
    create_table :leads do |t|
      t.string :Full_Name
      t.string :Compagny_Name
      t.string :Email
      t.string :Phone
      t.string :Project_Name
      t.text :Project_Description
      t.string :Department
      t.text :Message
      t.column :File_Data, :binary, :limit => 10.megabyte
      t.string :File_name
      t.timestamps
    end
  end
end

