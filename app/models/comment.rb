class Comment < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  with_options presence: true do
    validates :customer_id
    validates :item_id
    validates :comment
    validates :rate
    validates :nick_name
  end
end
