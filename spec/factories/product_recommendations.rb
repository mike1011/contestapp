# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product_recommendation do
    product_name "MyString"
    recommended_to "MyString"
    recommended_product_url "MyString"
    recommended_product_image_url "MyString"
    recommended_by "MyString"
    message "MyText"
    product_id 1
    account_id 1
  end
end
