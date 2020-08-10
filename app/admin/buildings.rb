ActiveAdmin.register Building do
    permit_params :admin_full_name, :admin_phone, :admin_email, :full_name_STA, :phone_TA, :email_TA, :address_id, :customer_id

    index do
      selectable_column
      id_column
      column :admin_full_name
      column :admin_phone
      column :full_name_STA
      column :phone_TA
      column :email_TA
      column :address_id
      column :customer_id
      actions
    end

    filter :admin_full_name
    filter :full_name_STA

    form do |f|
      f.inputs do
        f.input :admin_full_name
        f.input :admin_phone
        f.input :admin_email
        f.input :full_name_STA
        f.input :phone_TA
        f.input :email_TA
        f.input :address_id
        f.input :customer_id
      end
      f.actions
    end
end
