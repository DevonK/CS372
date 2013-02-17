class Post < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :body, :username
end
