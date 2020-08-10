class Battery < ApplicationRecord
    has_many :column, dependent: :destroy
    belongs_to :building, optional: true
end
