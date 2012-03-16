class CreateAuditoriums < ActiveRecord::Migration
  def up
    execute <<-SQL
      create sequence auditoriums_id_seq;
      create table auditoriums (
        id integer not null
          default nextval('auditoriums_id_seq'),
        theatre_id integer not null
          references theatres(id),
        auditorium_identifier varchar(64) not null
          check (length(auditorium_identifier) > 1),
        seats_available integer not null,
        primary key (id),
        unique(theatre_id, auditorium_identifier)
      );
      create index auditoriums_theatres_id_idx on auditoriums(theatre_id);
      alter table movie_showtimes drop column theatre_id;
      alter table movie_showtimes drop column auditorium;
      alter table movie_showtimes add column auditorium_id integer not null
        references auditoriums(id);
    SQL
  end

  def down
    execute <<-SQL
      alter table movie_showtimes drop column auditorium_id;
      alter table movie_showtimes add column theatre_id integer not null
        references theatres(id);
      alter table movie_showtimes add column auditorium varchar(16) not null
        check (length(auditorium) > 0);
      drop table auditoriums;
      drop sequence auditoriums_id_seq;
    SQL
  end
end
