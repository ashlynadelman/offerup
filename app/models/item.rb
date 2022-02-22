require 'open-uri'
class Item < ApplicationRecord
  before_validation :geocode_location

  def geocode_location
    if self.location.present?
      url = "https://maps.googleapis.com/maps/api/geocode/json?key=#{ENV['GMAP_API_KEY']}&address=#{URI.encode(self.location)}"

      raw_data = open(url).read

      parsed_data = JSON.parse(raw_data)

      if parsed_data["results"].present?
        self.location_latitude = parsed_data["results"][0]["geometry"]["location"]["lat"]

        self.location_longitude = parsed_data["results"][0]["geometry"]["location"]["lng"]

        self.location_formatted_address = parsed_data["results"][0]["formatted_address"]
      end
    end
  end
  mount_base64_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :user

  belongs_to :category

  belongs_to :price

  has_many   :searches,
             :dependent => :destroy

  # Indirect associations

  # Validations

  # Scopes

  def to_s
    category.to_s
  end

end
