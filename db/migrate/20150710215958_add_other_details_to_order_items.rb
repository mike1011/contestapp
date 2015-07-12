class AddOtherDetailsToOrderItems < ActiveRecord::Migration
  def change
    add_column :order_items, :title, :string
    add_column :order_items, :name, :string
    add_column :order_items, :vendor, :string
  end
end
