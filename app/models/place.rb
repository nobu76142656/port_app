class Place < ApplicationRecord
  geocoded_by :address
  after_validation :geocode, if: :address_changed?


  private
  def geocode
    uri = URI.escape("https://maps.googleapis.com/maps/api/geocode/json?address="+self.address.gsub(" ", "")+"&key=AIzaSyC0y-XaRkwtdhbjAy34iuzkwefWHV7IIjk")
    res = HTTP.get(uri).to_s
    response = JSON.parse(res)
    self.lat = response["results"][0]["geometry"]["location"]["lat"]
    self.lng = response["results"][0]["geometry"]["location"]["lng"]
  end
end
