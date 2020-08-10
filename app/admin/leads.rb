ActiveAdmin.register Lead do
  permit_params :Full_Name, :Compagny_Name, :Email, :Phone, :Project_Name, :Project_Description, :Department, :Message, :File_name

  index do
    selectable_column
    id_column
    column :Full_Name
    column :Compagny_Name
    column :Email
    column :Phone
    column :Project_Name
    column :Project_Description
    column :Department
    column :Message
    column :File_name
    actions
  end
  
  form do |f|
    f.inputs do
      f.input :Full_Name
      f.input :Compagny_Name
      f.input :Email
      f.input :Phone
      f.input :Project_Name
      f.input :Project_Description
      f.input :Department
      f.input :Message
      f.input :File_name
    end
    f.actions
  end

  
end

