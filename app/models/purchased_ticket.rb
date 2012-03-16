class PurchasedTicket < ActiveRecord::Base
  belongs_to :order
end
