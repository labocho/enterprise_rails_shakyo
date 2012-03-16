class AddIndexes < ActiveRecord::Migration
  def up
    execute <<-SQL
      create index movie_showtimes_movie_id_idx on movie_showtimes(movie_id);
      create index movie_showtimes_theatre_id_idx on movie_showtimes(theatre_id);

      create index theatres_address_zip_code_idx on theatres(address_zip_code);
      create index movie_showtimes_start_time_idx on movie_showtimes(start_time);
    SQL
  end

  def down
    execute <<-SQL
      drop index movie_showtimes_movie_id_idx;
      drop index movie_showtimes_theatre_id_idx;

      drop index theatres_address_zip_code_idx;
      drop index movie_showtimes_start_time_idx;
    SQL
  end
end
