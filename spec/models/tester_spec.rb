# Sample testing to try out Factory Girl (actual tests completed by iOS/Android team)

require 'spec_helper'

describe Tester do
  it "has a valid factory" do
  	FactoryGirl.create(:tester).should be_valid
  end
  it "is invalid without a platform" do
  	FactoryGirl.build(:tester, platform: nil).should_not be_valid
  end
  it "is invalid without a email" do
  	FactoryGirl.build(:tester, email: nil).should_not be_valid
  end
  it "is invalid with a duplicate udid" do
  	FactoryGirl.create(:tester, udid: "9876abc123cba") # test against for uniqueness
  	FactoryGirl.build(:tester, 
  		udid: "9876abc123cba").should_not be_valid
  end
  it "is invalid without a user_id" do
  	FactoryGirl.build(:tester, user_id: nil).should_not be_valid
  end
end
