class Theatre < ActiveRecord::Base
  # acts_as_address により find_within_miles メソッドが定義される
  # これにより Theatre.find_within_miles("XXXXX", 10) で郵便番号 XXXXX から 10 mile 以内の Theatre の scope が得られる
  acts_as_address
  belongs_to :movie
  has_many :movie_showtimes, dependent: :destroy
end
