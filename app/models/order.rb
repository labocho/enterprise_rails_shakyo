class Order < ActiveRecord::Base
  acts_as_address
  belongs_to :movie_showtimes
  belongs_to :payment_type
  has_many :purchased_tickets

  validate do
    validate_credit_card_number
  end

  private
  def validate_credit_card_number
    return unless payment_type
    unless payment_type.validate_card_number(credit_card_number, expiration_date)
      errors.add(:credit_card_number, :is_valid)
    end
  end
end
