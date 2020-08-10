class Address < ApplicationRecord
    require 'google_maps_service'
    has_many :building, dependent: :destroy
    has_many :customer, dependent: :destroy
    
    before_update :coords_update
    before_create :coords_update
    def coords_update
        gmaps = GoogleMapsService::Client.new(key: "#{ENV['GOOGLE_API']}")
        results = gmaps.geocode("#{self.number_and_street},#{self.city}, #{self.country}")
        self.latitude = results[0][:geometry][:location][:lat]
        self.longitude =  results[0][:geometry][:location][:lng]
        if results[0][:address_components][5] != nil
            self.state = results[0][:address_components][5][:short_name]
        end
        if results[0][:address_components][7] != nil 
            self.postal_code = results[0][:address_components][7][:short_name]

        end
        if results[0][:address_components][6] != nil
            self.country = results[0][:address_components][6][:short_name]
        end
        if results[0][:address_components][2] != nil
            self.city = results[0][:address_components][2][:long_name]
        end
    end
end
