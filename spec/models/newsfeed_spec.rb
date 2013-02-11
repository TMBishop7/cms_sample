# Sample testing to try out Factory Girl (actual tests completed by iOS/Android team)

require 'spec_helper'

describe Newsfeed do
  it "has a valid factory" do
  	FactoryGirl.create(:newsfeed).should be_valid
  end
  it "is invalid without a platform" do
  	FactoryGirl.build(:newsfeed, title: nil).should_not be_valid
  end
  it "is invalid without a email" do
  	FactoryGirl.build(:newsfeed, feed_url: nil).should_not be_valid
  end
  it "is invalid without a user_id" do
  	FactoryGirl.build(:newsfeed, user_id: nil).should_not be_valid
  end
end