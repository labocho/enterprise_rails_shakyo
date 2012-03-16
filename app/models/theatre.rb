class Theatre < ActiveRecord::Base
  belongs_to :movie
  has_many :movie_showtimes, dependent: :destroy
end
