class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  attr_accessible :body
  validates :body,  :presence => true,
                    :length => { :minimum => 5 }
  validates :topic_id, :user_id, :presence => true
end
