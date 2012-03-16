class Movie < ActiveRecord::Base
  VALID_RATINGS = %w(Unrated G PG PG-13 R NC-17)
  has_many :movie_showtimes, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: {maximum: 256}
  validates :length_minutes, numericality: {only_integer: true, greater_than: 0}
  validates :rating, inclusion: {in: VALID_RATINGS}
end
