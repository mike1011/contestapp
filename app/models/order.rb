class Order < ActiveRecord::Base
  has_many :order_items
  belongs_to :account
  has_many :cancelled_orders
  ##get all orders processed today
  scope :today, -> { where("created_at >= ?", Time.zone.now.beginning_of_day) }
  scope :this_month, -> { where(:created_at => Time.now.beginning_of_month..Time.now.end_of_month) }
  ##status of orders
#   pending: The finances are pending.
# authorized: The finances have been authorized.
# partially_paid: The finances have been partially paid.
# paid: The finances have been paid. (This is the default value.)
# partially_refunded: The finances have been partially refunded.
# refunded: The finances have been refunded.
# voided: The finances have been voided.
  scope :pending, -> { where(:financial_status => "pending" ) }
  scope :authorized, -> { where(:financial_status => "authorized" ) }
  scope :paid, -> { where(:financial_status => "paid" ) }
  scope :refunded, -> { where(:financial_status => "refunded" ) }
  scope :voided, -> { where(:financial_status => "voided" ) }



  # This method constructs the query based on
  # the passed-in parameters
  def self.candidate_list(params={})
    params[:sort] ||= "order_date asc"
    orders = order(params[:sort]).includes(:order_items)

    if params[:max_results].present?
      orders = orders.limit(params[:max_results].to_i)
    end

    if params[:product_id].present?
      orders = orders.where("order_items.shopify_product_id" => params[:product_id].to_i)
    end

    if params[:start_date].present?
      orders = orders.where(["orders.order_date >= ?", params[:start_date]])
    end

    if params[:end_date].present?
      orders = orders.where(["orders.order_date <= ?", params[:end_date]])
    end

    # .pluck returns an array containing the specified field
    return orders.pluck(:id).uniq
  end
end
