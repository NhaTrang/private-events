class EventsController < ApplicationController
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
	end

	def attend
		@event = Event.find_by(:id => params[:id])
		@user = User.find_by(:id => current_user.id)

		if @event.update_attributes(events_params) && @user.update_attributes(events_params) 	
			flash.now[:success] = "Successfully attending event"
			redirect_to 'show'
		else
			flash.now[:error] = "Error attending event"
			render 'show'
		end
	end

	private

		def events_params
			params.require(:event).permit(:title, :descript, :date, :location, :attendees, :attended_events)
		end



end
