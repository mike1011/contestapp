class ProductRecommendation < ActiveRecord::Base

	belongs_to :account
	belongs_to :product
end
