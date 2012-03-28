class ZipCode < ActiveRecord::Base
  self.primary_key = :zip

  def zips_within_miles(miles)
    ZipCode.where(
      "miles_between_lat_long(?, ?, zip_codes.latitude, zip_codes.longitude) < ?",
      latitude, longitude, miles
    )
  end
end
