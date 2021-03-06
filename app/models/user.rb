class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Virtual attribute for authenticating by either username or email
  # This is in addition to a real persisted field like 'username'
  attr_accessor :login

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation,
                  :remember_me, :login
  attr_accessible :username, :email, :password, :password_confirmation,
                  :remember_me, :admin, :banned, :as => :admin

  # Validation
  validates_presence_of :username
	validates_uniqueness_of :username

  # Relationships
  has_many :topics, :dependent => :destroy
  has_many :posts

  # Override method to allow login with username or email
  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  def active_for_authentication?
    super && !self.banned
  end

  def inactive_message
    "Your account has been banned!"
  end
end