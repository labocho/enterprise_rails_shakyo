class CreateAddresses < ActiveRecord::Migration
  def up
    execute <<-SQL
      create table addresses (
        line_1 varchar(255) not null
          check (length(line_1) > 0),
        line_2 varchar(255),
        city varchar(127) not null
          check (length(city) > 0),
        state varchar(2) not null
          check (length(state) = 2),
        zip_code varchar(9) not null
          references zip_codes(zip),
        phone_number varchar(10) not null
          check (length(phone_number) = 10)
      );
    SQL
  end

  def down
    execute <<-SQL
      drop table addresses;
    SQL
  end
end
