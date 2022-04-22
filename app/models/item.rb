class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :customers, through: :cart_items
  has_many :order_details, dependent: :destroy
  has_many :orders, through: :order_details

  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :genre_id
    validates :image
    validates :is_active
  end

  enum is_active: { available:true, unavailable:false }

  def with_tax_price
    (price * 1.1).floor
  end

  def self.search_for(content)
    Item.where('name LIKE ?', '%' + content + '%')
  end
end
