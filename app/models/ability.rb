class Ability
  include CanCan::Ability

  def initialize(user)
    #Guests
  	user ||= User.new

  	#Admins can manage everything
    if user.admin?
  		can :manage, :all
    else
      can [:read, :create], [Topic, Post]
  	end

  	can :manage, Topic, :user_id => user.id
    can :manage, Post, :user_id => user.id
  end
end
