class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  delegate :username, :created_at, :to => :user, :prefix => true

  attr_accessible :body
  attr_accessible :body, :topic_id, :user_id, :as => :admin

  validates :topic_id, :user_id, :presence => true
  validates :body, :length => { :minimum => 5, :too_short => "is too short (minimum is 5 characters)" }
end
