class Order < ActiveRecord::Base
  acts_as_address
  has_many :purchased_tickets
end
