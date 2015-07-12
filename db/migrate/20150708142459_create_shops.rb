class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.integer :account_id
      t.string :name
      t.string :owner
      t.string :domain
      t.string :email
      t.integer :shopify_id
      t.datetime :created_date
      t.float :latitude
      t.float :longitude
      t.string :phone
      t.string :address
      t.string :city
      t.integer :state
      t.string :zip
      t.string :country_code
      t.string :country
      

      t.timestamps
    end
    add_index :shops, :account_id
    add_index :shops, :domain
  end
end
