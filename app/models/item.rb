class Item < ApplicationRecord
  has_one_attached :image

  belongs_to :genre

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

end
