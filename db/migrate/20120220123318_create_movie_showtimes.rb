class CreateMovieShowtimes < ActiveRecord::Migration
  def up
    execute <<-SQL
      create sequence movie_showtimes_id_seq;
      create table movie_showtimes (
        id integer,
        movie_id integer,
        theatre_id integer,
        auditorium varchar(16),
        start_time timestamp with time zone,
        primary key (id)
      );
    SQL
  end
  
  def down
    execute <<-SQL
      drop table movie_showtimes;
      drop sequence movie_showtimes_id_seq;
    SQL
  end
end
