require "machinist/active_record"

Movie.blueprint do
  name { "Movie ##{sn}" }
  rating { "PG" }
  length_minutes { 10 }
end

MovieShowtime.blueprint do
  movie
  theatre
  auditorium { "1" }
  start_time { Time.now }
end

Theatre.blueprint do
  name { "Theatre ##{sn}" }
  address_line_1 { "123 Broadway" }
  address_city { "Cambridge" }
  address_state { "MA" }
  address_zip_code { "02139" }
  phone_number { "5555555555" }
end


