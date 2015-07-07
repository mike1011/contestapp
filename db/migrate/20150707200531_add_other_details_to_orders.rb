class AddOtherDetailsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cancel_reason, :string
    add_column :orders, :cancelled_at, :datetime
    add_column :orders, :ip_address, :string
  end
end
