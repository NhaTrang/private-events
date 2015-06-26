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
		#User.joins(:attended_events).where('invites.attended_events_id =?', 1)
		@attendee = User.joins(:attended_events).where('invites.attended_event_id =?', params[:id])
	end

	#consider setting this up through invite and maybe inner join it
	def attend
		@event = Event.find_by(:id => params[:id])
		@user = User.find_by(:id => current_user.id)

		if @event.update_attributes(attend_params) && @user.update_attributes(user_param) 	
			flash.now[:success] = "Successfully attending event"
			redirect_to 'show'
		else
			flash.now[:error] = "Error attending event"
			render 'show'
		end
	end

	private

		def events_params
			params.require(:event).permit(:title, :descript, :date, :location)
		end

		def attend_params
			params.require(:event).permit(:attendees)
		end

		def user_param
			params.require(:event).permit(:attended_events)
		end

end
