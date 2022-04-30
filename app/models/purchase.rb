class Purchase < ApplicationRecord
  attr_accessor :token

  has_one :shipping_address
  belongs_to :item
  belongs_to :user
end