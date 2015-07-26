class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = current_account.products.all
  end


  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = current_account.products.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = current_account.products.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  # GET /products/import
  # GET /products/import.json
  def import
    # Connect to Shopify
    shopify_integration = ShopifyIntegration.new(
      url: current_account.shopify_account_url,
      password: current_account.shopify_password,
      account_id: current_account.id
    )

    respond_to do |format|
      shopify_integration.connect
      result = shopify_integration.import_products
      format.html { redirect_to ({action: :index}), notice: "#{result[:created].to_i} created, #{result[:updated]} updated, #{result[:failed]} failed." }
    end
  end


 def recommend
  
  if request.get?
    Rails.logger.info "============LOADING PRODUCTS TO RECOMMEND============"
    ##show all products and recommend button against them
    products_ids=Product.pluck(:shopify_product_id)
    @products = ShopifyAPI::Product.find(:all, :params => {:id => products_ids})
    @products = @products.map do |c|
      { :product_id=>c.id ,:body_html => c.body_html,:img_src=> c.images.first.src, :title => c.title,:price=>c.variants.first.price,:vendor=>c.vendor}
    end 
    
     # recommendation=PoductRecommendation.new(product_recommendation_params)
   else
    Rails.logger.info "============RECOMMENDING A PRODUCT==============="
    ##when recommend form is posted,send mail
    @recommendation=ProductRecommendation.new(product_recommendation_params)
    @recommendation.recommended_product_image_url=current_account.shopify_account_url+"/products/#{@recommendation.product_name.parameterize}"
    @recommendation.recommended_by=current_account.shopify_shop_name
    @recommendation.account_id=current_account.id
    @recommendation.send_later=params[:send_later] if params[:send_later].present?
    @recommendation.send_later_datetime= DateTime.parse(params[:send_later_datetime]) if params[:send_later].present?
    if @recommendation.save!
      RecommendationMailer.delay.send_recommendation(@recommendation.id)
    end
   end   
   
 end


 def analysis
  ##@all_products= current_account.products.group(:name).count
 all_orders=current_account.orders.includes(:order_items).group("order_items.title").count
  @all_products=all_orders.merge(Hash[current_account.products.collect { |v| [v.name,"0"]  }]).merge(all_orders)
 

  @non_ordered_products=Product.pluck(:name).uniq - current_account.orders.includes(:order_items).pluck("order_items.title").uniq
  @ordered_products=current_account.orders.includes(:order_items).pluck("order_items.title").uniq  
  
 end


def search
  search=params[:query_first]|| params[:query_second] || params[:query_third]

  @products = ShopifyAPI::Product.find(:all, :params => {:title => search,:body_html => search, :order => "updated_at ASC" })
  @products = @products.map do |c|
      { :img_src=> c.images.first.src, :title => c.title,:price=>c.variants.first.price,:vendor=>c.vendor}
    end   
 ##p @products.first[:img_src]

  
end


# ////////////////////////////////////
  private
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = current_account.products.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def product_params
    params.require(:product,:product_recommendation).permit(:name, :shopify_product_id, :last_shopify_sync,:recommended_to,:message)
  end
  def product_recommendation_params
    params.require(:product_recommendation).permit(:recommended_to,:message,:product_id,:recommended_product_image_url,:product_name,:send_later,:send_later_datetime)
  end

end
