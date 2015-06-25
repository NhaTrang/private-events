class EventsController < ApplicationController
	def new
		@event = Event.new
	end

	def create
		@event = current_user.created_events.build(events_params)
		if @event.save
			flash[:success] = "Event successfully created"
			redirect_to events_path
		else
			flash[:error] = "Error creating event"
			render 'new'
		end
	end

	def index
		@events = Event.all
	end

	def show
		@event = Event.find_by(id: params[:id])
	end

	private

		def events_params
			params.require(:event).permit(:title, :descript, :date, :location)
		end

end
