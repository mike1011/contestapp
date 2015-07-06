# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :cancelled_order, :class => 'CancelledOrders' do
    cancelled false
    cancelled_at "2015-07-06 10:06:28"
    cancel_reason "MyString"
    order_id 1
    location "MyString"
    price 1
  end
end
