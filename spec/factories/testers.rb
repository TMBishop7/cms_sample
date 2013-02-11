# Sample testing to try out Factory Girl (actual tests completed by iOS/Android team)

FactoryGirl.define do
  factory :tester do
    platform "iOS"
    email "johndoe@example.com"
    sequence(:udid) { |n| "a1b2c3d4321#{n}"}
    sequence(:user_id) { |n| n }
  end
end