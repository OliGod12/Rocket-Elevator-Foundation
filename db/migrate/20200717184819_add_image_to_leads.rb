class AddImageToLeads < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :image, :string
  end
end
