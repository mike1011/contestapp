class AddSendLaterToProductRecommendations < ActiveRecord::Migration
  def change
    add_column :product_recommendations, :send_later, :boolean,:default=>false
    add_column :product_recommendations, :send_later_datetime, :datetime,:default=>nil
  end
end
