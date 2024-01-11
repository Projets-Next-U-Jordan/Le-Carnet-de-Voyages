module Api
    class UsersController < ApplicationController
    	before_action :set_user, only: [:show]

    	def index
        	@users = User.all
        	render json: @users
    	end

    	def show
        	render json: @user
    	end

		def create
			response_status = create_user
			if response_status == :created
				render json: @trip, status: :created
			else
				render json: @trip.errors, status: :unprocessable_entity
			end
		end
		  
		def create_ajax
			response_status = create_user
			if response_status == :created
				redirect_to url_for(controller: '/users', action: 'index') and return
			else
				redirect_to url_for(controller: '/users', action: 'new') and return
			end
		end

		private
  
      	def set_user
        	@user = User.find(params[:id])
    	end

		def create_user
			@user = User.new(user_params)
			if @user.save
				:created
			else
				:unprocessable_entity
			end
		end

		def update_user
			if @user.update(user_params)
				:ok
			else
				:unprocessable_entity
			end
		end
  
    	def user_params
    		params.require(:user).permit(:name, :email)
    	end

    end
end