require 'spec_helper'

describe User do
  it "has a valid factory" do
     FactoryGirl.create(:user).should be_valid
  end
  it "is invalid with a short password" do
     FactoryGirl.build(:userShort).should_not be_valid
  end
  it "is invalid with an invalid email" do
     FactoryGirl.build(:user, email: "FAKE").should_not be_valid
  end
  it "is invalid without a username" do
     FactoryGirl.build(:user, username: nil).should_not be_valid
  end
end