class Event < ActiveRecord::Base
  	scope :upcoming, -> { where('date >= ?', DateTime.now) }
  	scope :past, -> { where('date < ?', DateTime.now) }

	validates :title, presence: true
	validates :date, presence:true

	belongs_to :creator, :class_name => 'User'

	has_many :people, class_name: "Invite", foreign_key: "attended_event_id",dependent: :destroy
	has_many :attendees, through: :people, source: :attendee

	def past_events
		date.past
	end

	def upcoming_events
		date.upcoming
	end

end
