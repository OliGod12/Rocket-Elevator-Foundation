ActiveAdmin.register Column do
    permit_params :column_type, :number_of_floors, :status, :informations, :notes, :battery_id

    index do
      selectable_column
      id_column

      column :column_type
      column :number_of_floors
      column :status
      column :informations
      column :notes
      column :battery_id
      actions
    end

    filter :column_type
    filter :number_of_floors
    filter :status

    form do |f|
      f.inputs do
        f.input :column_type
        f.input :number_of_floors
        f.input :status
        f.input :informations
        f.input :notes
        f.input :battery_id
      end
      f.actions
    end
end
