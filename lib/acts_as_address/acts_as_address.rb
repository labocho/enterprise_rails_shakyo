module ActsAsAddress
  module ClassMethods
    def acts_as_address
      class_eval do
        belongs_to :zip_code, foreign_key: :zip_code

        validates :state, presence: true, length: {maximum: 2}
        validates :city, presence: true, length: {maximum: 127}
        validates :line_1, presence: true, length: {maximum: 255}
        validates :line_2, presence: true, length: {maximum: 255}

        class << self
          def find_within_miles(zip, miles)
            z = ZipCode.find_by_zip(zip)
            if zip
              where(
                "miles_between_lat_long(?, ?, zip_codes.latitude, zip_codes.longitude) < ?",
                z.latitude, z.longitude, miles
              ).includes(:zip_code)
            else
              []
            end
          end
        end
      end
    end
  end
  def self.included(base)
    base.extend ClassMethods
  end
end
