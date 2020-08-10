ActiveAdmin.register Battery do
  permit_params :battery_type, :status, :commission_date, :date_of_last_inspect, :certificate_of_operations, :informations, :notes, :building_id, :employee_id

  index do
    selectable_column
    id_column
    column :battery_type
    column :status
    column :commission_date
    column :date_of_last_inspect
    column :certificate_of_operations
    column :informations
    column :notes
    column :building_id
    column :employee_id
    actions
  end

  filter :battery_type
  filter :status
  filter :building_id
  filter :employee_id

  form do |f|
    f.inputs do
      f.input :battery_type
      f.input :status
      f.input :commission_date
      f.input :date_of_last_inspect
      f.input :certificate_of_operations
      f.input :informations
      f.input :notes
      f.input :building_id
      f.input :employee_id
    end
    f.actions
  end
end

