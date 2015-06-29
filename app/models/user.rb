class User < ActiveRecord::Base
	before_create :create_remember_token

	validates :email, presence: true, uniqueness: true
	validates :name, presence: true

	has_many :activities, class_name: "Invite", foreign_key: "attendee_id", dependent: :destroy
	has_many :created_events, class_name: 'Event', :foreign_key => :creator_id
	has_many :attended_events, through: :activities, source: :attended_event


	def upcoming_events
		attended_events.upcoming
	end

	def previous_events
		attended_events.past
	end

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.digest(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private

		def create_remember_token
			self.remember_token = User.digest(User.new_remember_token)
		end
end
