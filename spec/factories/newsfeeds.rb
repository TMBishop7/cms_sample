# Sample testing to try out Factory Girl (actual tests completed by iOS/Android team)

FactoryGirl.define do
  factory :newsfeed do
    title "Campus News"
    feed_url "blog.example.com/news.html"
    sequence(:user_id) { |n| n }
  end
end