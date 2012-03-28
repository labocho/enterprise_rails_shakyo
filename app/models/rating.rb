class Rating < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {maximum:  16}
  validates :description, presence: true

  # 定数なので簡単に参照できるし
  # クラス読み込み時に1度ロードされるだけ
  # オブジェクトなので Movie.new(rating: Rating::PG13) のように使える
  G       = find_by_name("G")
  PG      = find_by_name("PG")
  PG13    = find_by_name("PG-13")
  R       = find_by_name("R")
  NC17    = find_by_name("NC-17")
  UNRATED = find_by_name("Unrated")
end
