class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by(email: params[:session][:email])
		if @user
			flash.now[:success] = "Successfully logged in"
			sign_in @user
			redirect_to root_path
		else
			flash.now[:error] = "Email incorrect or user not found"
			render 'new'
		end
	end

	def destroy
		sign_out
		flash.now[:success] = "Successfully logged out"
		redirect_to root_path
	end
end
