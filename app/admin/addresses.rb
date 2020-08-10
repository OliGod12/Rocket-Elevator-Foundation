ActiveAdmin.register Address do
  
  permit_params :type_of_address, :status, :entity, :number_and_street, :state,  :suite_or_apartment, :city, :postal_code, :country, :notes

  index do
    selectable_column
    id_column
    column :type_of_address
    column :status
    column :entity
    column :number_and_street
    column :state
    column :suite_or_apartment
    column :city
    column :postal_code
    column :country
    column :notes
    actions
  end

  filter :type_of_address
  filter :number_and_street
  filter :city

  form do |f|
    f.inputs do
      f.input :type_of_address
      f.input :status
      f.input :entity
      f.input :number_and_street
      f.input :suite_or_apartment
      f.input :state
      f.input :city
      f.input :postal_code
      f.input :country
      f.input :notes
    end
    f.actions
  end

end
