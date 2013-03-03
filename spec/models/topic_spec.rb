require 'spec_helper'

describe Topic do
  it "has a valid factory" do
    FactoryGirl.create(:topic).should be_valid
  end
  it "is invalid without a title" do
    FactoryGirl.build(:topic, title: nil).should_not be_valid
  end
  it "is invalid with a short title" do
    FactoryGirl.build(:topic, title: "a").should_not be_valid
  end
  it "is invalid without content" do
    FactoryGirl.build(:topic, content: nil).should_not be_valid
  end
  it "is invalid with short content" do
    FactoryGirl.build(:topic, content: "a").should_not be_valid
  end
  it "is invalid without a user_id" do
    FactoryGirl.build(:topic, user_id: nil).should_not be_valid
  end
end