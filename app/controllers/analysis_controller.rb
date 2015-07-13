class AnalysisController < ApplicationController
  

  def index
  	# Show All by default
  	@timely_orders_title_selected="All"
  	      
         @timely_orders=current_account.orders.group("DATE(order_date)").order("order_date ASC").count
         @order_financial_status=current_account.orders.includes(:order_items).group(:financial_status).order("order_date ASC").count
         @ordered_products=current_account.orders.includes(:order_items).group("order_items.name").order("order_date ASC").count
      
  end


  def customer_analysis
    show_coming_soon_page

    
  end

  def personal_analysis
    show_coming_soon_page
    
  end

  def show
  end
end
