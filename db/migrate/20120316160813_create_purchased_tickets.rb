class CreatePurchasedTickets < ActiveRecord::Migration
  def up
    execute <<-SQL
      create sequence purchased_tickets_id_seq;
      create table purchased_tickets (
        id integer not null
          default nextval('purchased_tickets_id_seq'),
        order_id integer not null
          references orders(id),
        purchase_price_cents integer not null
      );
    SQL
  end

  def down
    execute <<-SQL
      drop table purchased_tickets;
      drop sequence purchased_tickets_id_seq;
    SQL
  end
end
