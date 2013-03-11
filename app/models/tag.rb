class Tag < ActiveRecord::Base
  belongs_to :topic
  attr_accessible :name
  attr_accessible :name, :topic_id, :as => :admin
end
