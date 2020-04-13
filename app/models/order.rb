class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items
  validates_uniqueness_of :number

  before_create :generate_number
  before_save :calculate_total_price

private
  def generate_number
    last_number = Order.order(:created_at).last.number
    self.number = last_number.next
  end

  def calculate_total_price
    total_price = 0
    self.order_items.each do |item|
      total_price = total_price + (item.product.price * item.qty)
    end
    self.total_price = total_price
  end
end
