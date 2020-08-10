class WarehouseBase < ActiveRecord::Base
    establish_connection DB_SECOND
    self.abstract_class = true
  end
