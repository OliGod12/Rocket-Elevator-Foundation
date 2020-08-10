class Column < ApplicationRecord
    has_many :elevator, dependent: :destroy
    belongs_to :battery, optional: true
end
