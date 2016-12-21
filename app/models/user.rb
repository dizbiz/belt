class User < ActiveRecord::Base
  has_secure_password

  has_many :group_rosters, dependent: :destroy
  has_many :groups, through: :group_rosters, dependent: :destroy
  has_many :groups

end
