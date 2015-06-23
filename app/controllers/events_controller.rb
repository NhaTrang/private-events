class EventsController < ApplicationController
	def new
		@event = Event.new
	end

	def create
		@event = current_user.events.build(events_params)
		if @event.save
			flash[:success] = "Event successfully created"
			redirect_to root_url
		else
			flash[:error] = "Error creating event"
			render 'new'
		end
	end

	def index
		@events = Event.all
	end

	def show
	end

	private

		def events_params
			params.require(:event).permit(:name, :date)
		end

end
