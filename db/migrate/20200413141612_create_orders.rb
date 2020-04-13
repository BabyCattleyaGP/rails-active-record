class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :number
      t.integer :customer_id
      t.float :total_price
      t.date :order_date

      t.timestamps
    end
  end
end
