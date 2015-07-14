class EventsController < ApplicationController
	before_action :signed_in?, only: [:new, :create]

	def new
		@event = Event.new
	end

	def create
		@event = current_user.created_events.build(events_params)
		if @event.save
			flash.now[:success] = "Event successfully created"
			redirect_to events_path
		else
			flash.now[:error] = "Error creating event"
			render 'new'
		end
	end

	def index
		@events = Event.all
	end

	def show
		@event = Event.find_by(id: params[:id])
		@invite = Invite.new
		@attendees = User.joins(:attended_events).where('invites.attended_event_id =?', params[:id])
	end

	private

	def events_params
		params.require(:event).permit(:title, :descript, :date, :location)
	end

	def signed_in?
		redirect_to root_url unless !current_user.nil?
	end

end
