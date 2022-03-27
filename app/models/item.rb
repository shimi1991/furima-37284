class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name,          presence: true
  validates :explanation,        presence: true
  validates :status_id,          numericality: { other_than: 1, message: "can't be blank"}
  validates :delivery_charge_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefectures_id,     numericality: { other_than: 1, message: "can't be blank"}
  validates :days_id,            numericality: { other_than: 1, message: "can't be blank"}
  validates :category_id,        numericality: { other_than: 1, message: "can't be blank"}
  validates :price,              presence: true, inclusion: { in: 300..9_999_999, message: "out of setting range" }, format: { with: /\A[0-9]+\z/, message: "invalid. Input half-width characters"}
  validates :user,               presence: true
  validates :image,              presence: true
end