class Topic < ActiveRecord::Base
  belongs_to :user
  delegate :username, :created_at, :to => :user, :prefix => true
  has_many :posts, :dependent => :destroy
  has_many :tags

  attr_accessible :content, :title, :tags_attributes
  attr_accessible :content, :title, :tags_attributes, :user_id, :tag_ids, :as => :admin

  validates :user_id, :presence => true
  validates :title, :length => { :in => 2..25 }
  validates :content, :length => { :minimum => 9, :too_short => "is too short (minimum is 5 characters)" }
  # Note: A minimum of 4 characters worth of HTML tags are in the content,
  #       thus the real min size is 9-4=5

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end