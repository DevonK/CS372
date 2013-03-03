require 'spec_helper'

describe Post do
  it "has a valid factory" do
    FactoryGirl.create(:post).should be_valid
  end
  it "is invalid without a body" do
    FactoryGirl.build(:post, body: nil).should_not be_valid
  end
  it "is invalid with a short body" do
    FactoryGirl.build(:post, body: "a").should_not be_valid
  end
  it "is invalid without a user_id" do
    FactoryGirl.build(:post, user_id: nil).should_not be_valid
  end
  it "is invalid without a topic_id" do
    FactoryGirl.build(:post, topic_id: nil).should_not be_valid
  end
end