ActiveAdmin.register BuildingDetail do
    # belongs_to :building, polymorphic: true
    permit_params :info_key, :value
    
    index do
      selectable_column
      id_column
      column :info_key
      column :value
      column :building_id
      actions 
    end

    filter :building_id

    form do |f|
      f.inputs do
        f.input :info_key
        f.input :value
      end
    f.actions
  end
end
