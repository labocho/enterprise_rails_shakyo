class AmericanExpress < PaymentType
  def validate_card_number (card_number, expiry)
    p "AMEX card number validation"
  end

  def process_order(name, address, amount)
    p "AMEX process order"
  end
end
