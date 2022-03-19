class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :item_name,          presence: true
  validates :explanation,        presence: true
  validates :status_id,          presence: true
  validates :delivery_charge_id, presence: true
  validates :prefectures_id,     presence: true
  validates :days_id,            presence: true
  validates :category_id,        presence: true
  validates :price,              presence: true
  validates :user,               presence: true
  validates :image,              presence: true
end