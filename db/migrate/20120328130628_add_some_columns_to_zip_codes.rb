class AddSomeColumnsToZipCodes < ActiveRecord::Migration
  def up
    execute <<-SQL
      alter table addresses drop constraint addresses_zip_code_fkey;
      drop table zip_codes;
      create table zip_codes (
        zip varchar(16) not null,
        city varchar(255) not null,
        state_abbreviation varchar(2) not null,
        country varchar(255) not null,
        latitude numeric not null,
        longitude numeric not null,
        primary key (zip)
      );
      alter table addresses add foreign key (zip_code) references zip_codes (zip);
    SQL
  end
  def down
    execute <<-SQL
      alter table addresses drop constraint addresses_zip_code_fkey;
      drop table zip_codes;
      create table zip_codes (
        zip varchar(16) not null,
        primary key (zip)
      );
      alter table addresses add foreign key (zip_code) references zip_codes (zip);
    SQL
  end
end
