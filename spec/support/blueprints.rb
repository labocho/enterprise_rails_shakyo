require "machinist/active_record"

Movie.blueprint do
  name { "Movie ##{sn}" }
  rating { "PG" }
  length_minutes { 10 }
end
