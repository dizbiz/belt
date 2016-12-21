class Group < ActiveRecord::Base
	has_many :group_rosters, dependent: :destroy
	has_many :users, through: :group_rosters, dependent: :destroy
	belongs_to :host, :class_name => :User, :foreign_key => "user_id"

	validates :name, length: {minimum: 5}, allow_blank: false
	validates :description, length: {minimum: 15}, allow_blank: false
end
