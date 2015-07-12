# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :new_offer do
    name "MyString"
    account_id 1
    start_datetime "2015-07-12 08:00:57"
    end_datetime "2015-07-12 08:00:57"
    image_file_name "MyString"
    image_file_size "MyString"
    image_content_type "MyString"
    image_updated_at "2015-07-12 08:00:57"
    video_content_type "MyString"
    video_file_name "MyString"
    video_file_size 1
    video_updated_at "2015-07-12 08:00:57"
    status ""
    delay_till "2015-07-12 08:00:57"
  end
end
