class PaymentType < ActiveRecord::Base
  has_many :orders
  VISA = find_by_type("Visa")
  MASTER_CARD = find_by_type("MasterCard")
  AMEX = find_by_type("AmericanExpress")

  def validate_card_number (card_number, expiry)
    raise "This method must be redefined in the subclass"
  end

  def process_order(name, address, amount)
    raise "This method must be redefined in the subclass"
  end
end
