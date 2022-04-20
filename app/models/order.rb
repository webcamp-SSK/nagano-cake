class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  has_many :items, through: :order_details

  with_options presence: true do
    validates :customer_id
    validates :postal_code
    validates :address
    validates :name
    validates :shipping_cost
    validates :total_payment
    validates :payment_method
    validates :status
  end

  enum status: { waiting: 0, confirm: 1, production: 2, preparation: 3, sent: 4 }
  enum payment_method: { credit_card: 0, transfer: 1 }

  def status_display
    status_i18n
  end
  
end