class Topic < ActiveRecord::Base
  belongs_to :user
  delegate :username, :created_at, :to => :user, :prefix => true
  has_many :posts, :dependent => :destroy
  has_many :tags

  attr_accessible :content, :title, :tags_attributes
  attr_accessible :content, :title, :tags_attributes, :user_id, :tag_ids, :as => :admin

  validates :title,:content,  :presence => true,
                              :length => { :minimum => 2 }
  validates :user_id, :presence => true

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end