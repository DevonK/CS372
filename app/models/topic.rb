class Topic < ActiveRecord::Base
  attr_accessible :content, :title, :tags_attributes

  validates :title,:content,  :presence => true,
                              :length => { :minimum => 2 }

  belongs_to :user
  has_many :posts, :dependent => :destroy
  has_many :tags

  accepts_nested_attributes_for :tags, :allow_destroy => :true,
    :reject_if => proc { |attrs| attrs.all? { |k, v| v.blank? } }
end