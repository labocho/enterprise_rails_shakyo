class CreateOrders < ActiveRecord::Migration
  def up
    execute <<-SQL
      create sequence orders_id_seq;
      create table orders (
        id integer not null
          default nextval('orders_id_seq'),
        confirmation_code varchar(255)
          check(length(confirmation_code) > 0),
        movie_showtime_id integer not null
          references movie_showtimes (id),
        payment_type_id integer not null,
        credit_card_number varchar(16)
          check(length(credit_card_number) = 16),
        expiration_date date not null,
        primary key (id)
      ) inherits (addresses);
    SQL
  end

  def down
    execute <<-SQL
      drop table orders;
      drop sequence orders_id_seq;
    SQL
  end
end
