ActiveAdmin.register Customer do
   
    permit_params :customer_create_date, :company_name, :full_name_company_contact, :company_contact_phone, :company_contact_email, :company_description, :full_name_STA, :phone_TA, :email_TA, :address_id #DO we need address here?

    index do
      selectable_column
      id_column
      column :customer_create_date
      column :company_name
      column :full_name_company_contact
      column :company_contact_phone
      column :company_contact_email
      column :company_description
      column :full_name_STA
      column :phone_TA
      column :email_TA
      column :address_id
      actions
    end

    filter :company_name
    filter :full_name_company_contact 
    filter :full_name_STA

    form do |f|
      f.inputs do
        f.input :customer_create_date
        f.input :company_name
        f.input :full_name_company_contact
        f.input :company_contact_phone
        f.input :company_contact_email
        f.input :company_description
        f.input :full_name_STA
        f.input :phone_TA
        f.input :email_TA
        f.input :address_id
      end
      f.actions
    end
end
