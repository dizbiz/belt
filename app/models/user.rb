class User < ActiveRecord::Base
  has_secure_password

 	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :first_name, :last_name, presence: true, length: { in: 2..20 }
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	before_save do
		self.email.downcase!
	end
  before_create do
    self.admin = false #assuming there is an admin field with a boolean value
  end


  has_many :group_rosters, dependent: :destroy
  has_many :groups, through: :group_rosters, dependent: :destroy
  has_many :groups

end
