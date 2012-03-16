require "acts_as_address/acts_as_address"
ActiveRecord::Base.class_eval do
  include ActsAsAddress
end
