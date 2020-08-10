ActiveAdmin.register Elevator do

  permit_params :serial_number, :model, :elevator_type, :status, :commission_date, :date_of_last_inspection, :certificate_of_inspection, :informations, :notes, :column_id

  index do
    selectable_column
    id_column
    column :serial_number
    column :model
    column :elevator_type
    column :status
    column :commission_date
    column :date_of_last_inspection
    column :certificate_of_inspection
    column :informations
    column :notes
    column :column_id
    actions
  end

  filter :model
  filter :elevator_type
  filter :status
  filter :column_id

  form do |f|
    f.inputs do
      f.input :serial_number
      f.input :model
      f.input :elevator_type
      f.input :status
      f.input :commission_date
      f.input :date_of_last_inspection
      f.input :certificate_of_inspection
      f.input :informations
      f.input :notes
      f.input :column_id
    end
    f.actions
  end
end

