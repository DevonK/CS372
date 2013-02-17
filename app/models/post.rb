class Post < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :body, :username
  validates :body,  :presence => true
end
