class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefectures_id, :municipalities, :address, :building_name, :phone_number, :item_id, :user_id, :token

  validates :prefectures_id, numericality: {other_than: 0, message: "can't be blank"}

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :municipalities
    validates :address
    validates :phone_number, format: {with: /\A[0-9]+\z/}
  end
  
  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)

    ShippingAddress.create(post_code: post_code, prefectures_id: prefectures_id, municipalities: municipalities, address: address, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
