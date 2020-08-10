class Building < ApplicationRecord
    has_many :battery, dependent: :destroy
    has_many :building_details, dependent: :destroy
    belongs_to :address, optional: true
    belongs_to :customer, optional: true
end
