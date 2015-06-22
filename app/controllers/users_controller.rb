class UsersController < ApplicationController
	def show
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			flash[:success] = "User successfully created"
			redirect_to root_url
		else
			flash[:error] = "Error creating user"
			render 'new'
		end
	end

	private

		def user_params
			User.require(:user).permit(:username)
		end
end
