class CreateZipCodes < ActiveRecord::Migration
  def up
    execute <<-SQL
      create table zip_codes (
        zip varchar(16) not null,
        primary key (zip)
      );
    SQL
  end

  def down
    execute <<-SQL
      drop table zip_codes;
    SQL
  end
end
