class Theatre < ActiveRecord::Base
  acts_as_address
  belongs_to :movie
  has_many :movie_showtimes, dependent: :destroy
end
