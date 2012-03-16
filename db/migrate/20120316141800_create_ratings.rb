class CreateRatings < ActiveRecord::Migration
  def up
    execute <<-SQL
      create sequence ratings_id_seq;
      create table ratings (
        id integer not null
          default nextval('ratings_id_seq'),
        name varchar(16) not null unique
          check (length(name) > 0),
        description text,
        primary key (id)
      );

      alter table movies drop column rating;
      alter table movies add column rating_id integer not null references ratings(id);
    SQL
  end

  def down
    execute <<-SQL
      alter table movies drop column rating_id;
      alter table movies add column rating varchar(8) not null
        check (rating in ('Unrated', 'G', 'PG', 'PG-13', 'R', 'NC-17'));
      drop table ratings;
      drop sequence ratings_id_seq;
    SQL
  end
end
