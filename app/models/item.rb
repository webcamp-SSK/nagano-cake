class Item < ApplicationRecord
  has_one_attached :image

  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
  belongs_to :genre

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :genre_id
    validates :image
    validates :is_active
  end

  enum is_active: { available:0, unavailable:1 }
end
