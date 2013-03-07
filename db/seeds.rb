# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.attr_accessible :id
Topic.attr_accessible :id, :user_id
Post.attr_accessible :id, :topic_id, :user_id

# Admin user
admin = User.create!(
  :id => 1,
  :username => "admin",
  :email => "admin@giga-blab.com",
  :password => "adminadmin",
  :password_confirmation => "adminadmin")
admin.update_attribute(:admin, 1)

# Admin creates topic
Topic.create!(
  :id => 1,
  :title => "I'm a title - admin",
  :content => "I'm some content - admin",
  :user_id => 1)

# Admin posts in admin's topic
Post.create!(
  :id => 1,
  :body => "I'm a post body - admin",
  :user_id => 1,
  :topic_id => 1)

# Create normal user
User.create!(
  :id => 2,
  :username => "user",
  :email => "user@giga-blab.com",
  :password => "useruser",
  :password_confirmation => "useruser")

# User creates topic
Topic.create!(
  :id => 2,
  :title => "I'm a title - user",
  :content => "I'm some content - user",
  :user_id => 2)

# User posts in users's topic
Post.create!(
  :id => 2,
  :body => "I'm a post body - user",
  :user_id => 2,
  :topic_id => 2)

# User posts in admin's topic
Post.create!(
  :id => 3,
  :body => "I'm a post body - user",
  :user_id => 2,
  :topic_id => 1)

# Admin posts in user's topic
Post.create!(
  :id => 4,
  :body => "I'm a post body - admin",
  :user_id => 1,
  :topic_id => 2)