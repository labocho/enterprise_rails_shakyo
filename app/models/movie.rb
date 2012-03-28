class Movie < ActiveRecord::Base
  belongs_to :rating
  has_many :movie_showtimes, dependent: :destroy
  validates :name, presence: true, uniqueness: true, length: {maximum: 256}
  validates :length_minutes, numericality: {only_integer: true, greater_than: 0}
end
