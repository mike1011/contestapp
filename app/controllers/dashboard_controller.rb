class DashboardController < ApplicationController
  def index
    # Load past results in reverse order
    @contests = Contest.order("created_at desc")

    # Instantiate a new Contest so the form loads properly
    @contest = Contest.new

    # Load the Products we want to use for Contests
    @products = Product.all.order(:name)
p    ShopifyAPI::CustomerSavedSearch.all#( from: :search, params: {q: "orders_count: >1"})

  end


  # This method creates a Contest and returns the winner(s) in the
  # notice message
  def create_contest
    @contest = Contest.new(contest_params)

    # Store the name of the product for easier readability
    @contest.product_name = Product.find_by_shopify_product_id(contest_params[:product_id]).try(:name) if contest_params[:product_id].present?

    respond_to do |format|
      if @contest.save
        # Pick a winner
        candidates = Order.candidate_list(params)
        contest_results = ContestResults.new(candidates)

        # Save the winner        
        @contest.update_attribute(:order_id, contest_results.results)

        format.html { redirect_to root_path, notice: "Contest Winner: <a href='#{order_path(@contest.order)}'>#{@contest.order.email}</a>" }
        format.json { render action: 'show', status: :created, location: @contest }

      else
        format.html { redirect_to root_path, alert: "Unable to create a Contest #{@contest.errors.full_messages.to_s}" }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end

  end

  def announcements

    if request.post?

    else

    end
    
  end


  def analysis
    if request.post?

    else
      anaysis_by=params[:analysis_by]
      @title=anaysis_by=="Monthly" ? "This Month's" : anaysis_by=="Yearly" ? "This Year's" : "Today's"
      case anaysis_by
          when "Custom" 
            puts "============Custom===============" 
          when "Monthly"
            puts "============Monthly==========="
            @products= current_account.products  
            @orders=current_account.orders.this_month.group("DATE(order_date)").order("order_date ASC").count
          
          when "Yearly" 
            puts "==========Yearly=============="  
            @products= current_account.products    
             @orders=current_account.orders.this_year.group("DATE(order_date)").order("order_date ASC").count
           
          else
            puts "==========DAILY DEFAULT========"
            @products= current_account.products  
            @orders=current_account.orders.today.group("DATE(order_date)").order("order_date ASC").count
            ##other way
            ##count(:order => 'DATE(order_date) DESC', :group => ["DATE(order_date)"]).each {|u| puts "#{u[0]} -> #{u[1]}" }
           
      end

    end
  end


  private

  def contest_params
    params.require(:contest).permit(:name, :product_id, :start_date, :end_date, :max_results, :order_id, :criteria)
  end


end
