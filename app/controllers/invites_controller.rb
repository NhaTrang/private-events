class InvitesController < ApplicationController
	def create
		@event = Event.find_by(:id => params[:id])
		@invite = Invite.new(attend_params)

		if @invite.save
			flash[:success] = "Successfully attending event"
			redirect_to event_info_path(@event.id)
		else
			flash[:error] = "Error attending event"
			render event_info_path(@event.id)
		end
	end

	private
	def attend_params
		params.require(:invite).permit(:attendee_id, :attended_event_id)
	end

end
