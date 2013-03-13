class AddFlaggedToTopics < ActiveRecord::Migration
  def self.up
    add_column :topics, :flagged, :boolean, :default => false
  end

  def self.down
    remove_column :topics, :flagged
  end
end