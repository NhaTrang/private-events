class Event < ActiveRecord::Base
	validates :title, presence: true
	validates :date, presence:true

	belongs_to :creator, :class_name => 'User'
	has_many :attendees, through: :invites
end
