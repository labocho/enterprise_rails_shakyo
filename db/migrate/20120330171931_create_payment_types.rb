class CreatePaymentTypes < ActiveRecord::Migration
  def up
    execute <<-SQL
      create sequence payment_types_id_seq;
      create table payment_types (
        id integer not null
          default nextval('payment_types_id_seq'),
        type varchar(128) not null unique
          check (length(type) > 0),
         primary key (id)
      );
      alter table orders add foreign key (payment_type_id) references payment_types (id);
    SQL
  end

  def down
    execute <<-SQL
      alter table orders drop constraint orders_payment_type_id_fkey;
      drop table  payment_types;
      drop sequence payment_types_id_seq;
    SQL
  end
end
