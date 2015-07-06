class CreateCancelledOrders < ActiveRecord::Migration
  def change
    create_table :cancelled_orders do |t|
      t.boolean :cancelled
      t.datetime :cancelled_at
      t.string :cancel_reason
      t.integer :order_id
      t.string :location
      t.integer :price

      t.timestamps
    end
    add_index :cancelled_orders, :order_id
  end
end
