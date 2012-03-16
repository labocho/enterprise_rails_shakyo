class RecreateTheatresInheritsAddresses < ActiveRecord::Migration
  def up
    execute <<-SQL
      alter table auditoriums drop constraint auditoriums_theatre_id_fkey;
      drop table theatres;
      create table theatres (
        id integer not null
          default nextval('theatres_id_seq'),
        name varchar(255) not null unique,
        primary key (id)
      ) inherits (addresses);
      alter table auditoriums add foreign key (theatre_id) references theatres(id);
    SQL
  end

  def down
    execute <<-SQL
      alter table auditoriums drop constraint auditoriums_theatre_id_fkey;
      drop table theatres;
      create table theatres (
        id integer
          default nextval('theatres_id_seq'),
        name varchar(256),
        address_line_1 varchar(256),
        address_line_2 varchar(256),
        address_city varchar(128),
        address_state varchar(2),
        address_zip_code varchar(9),
        phone_number varchar(10),
        primary key (id)
      );
      create index theatres_address_zip_code_idx on theatres(address_zip_code);
      alter table auditoriums add foreign key (theatre_id) references theatres(id);
    SQL
  end
end
