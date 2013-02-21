class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  attr_accessible :body
  validates :body,  :presence => true,
                    :length => { :minimum => 2 }
end
