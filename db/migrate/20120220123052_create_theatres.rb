class CreateTheatres < ActiveRecord::Migration
  def up
    execute <<-SQL
      create sequence theatres_id_seq;
      create table theatres (
        id integer,
        name varchar(256),
        address_line_1 varchar(256),
        address_line_2 varchar(256),
        address_city varchar(128),
        address_state varchar(2),
        address_zip_code varchar(9),
        phone_number varchar(10),
        primary key (id)
      );
    SQL
  end
  
  def down
    execute <<-SQL
      drop table theatres;
      drop sequence theatres_id_seq;
    SQL
  end
end
