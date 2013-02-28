class Ability
  include CanCan::Ability

  def initialize(user)
    #Guests
  	user ||= User.new
  	#Admins can manage everything
    if user.admin?
  		can :manage, :all
  	end

  	can [:read, :create], [Topic, Post]
  	can [:update, :destroy], Topic do |topic|
  		topic.try(:user_id) == user.id
    end
    can :destroy, Post do |post|
  		post.try(:user_id) == user.id
  	end
  end
end
