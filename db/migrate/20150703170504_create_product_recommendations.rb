class CreateProductRecommendations < ActiveRecord::Migration
  def change
    create_table :product_recommendations do |t|
      t.string :product_name
      t.string :recommended_to
      t.string :recommended_product_url
      t.string :recommended_product_image_url
      t.string :recommended_by
      t.text :message
      t.integer :product_id
      t.integer :account_id

      t.timestamps
    end
    add_index :product_recommendations, :product_id
    add_index :product_recommendations, :account_id
  end
end
