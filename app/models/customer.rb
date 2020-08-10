class Customer < ApplicationRecord
    belongs_to :address, optional: true
    has_many :building, dependent: :destroy
end
