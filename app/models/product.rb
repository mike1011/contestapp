class Product < ActiveRecord::Base
	has_many :variants
	belongs_to :account


  has_many :product_recommendations
  has_many :recommended_accounts, through: :product_recommendations, source: :product

end
