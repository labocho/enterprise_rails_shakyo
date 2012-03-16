class MovieShowtime < ActiveRecord::Base
  belongs_to :movie
  belongs_to :theatre

  validates :movie, presence: true
  validates :theatre, presence: true
  validates :start_time, presence: true
  validates :auditorium, presence: true, length: {maximum: 16}
end
