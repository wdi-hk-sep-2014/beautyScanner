class Merchant < ActiveRecord::Base

  belongs_to :category
  belongs_to :location
  has_many :ratings

  reverse_geocoded_by :lat, :lng
  after_validation :reverse_geocode  # auto-fetch address
  geocoded_by :address, :latitude  => :lat, :longitude => :lng   # can also be an IP address
  after_validation :geocode          # auto-fetch coordinates

  def reviews_score
    "*" * [*1..5].sample
  end
end
