class V1::UsersController < ApplicationController
	before_action :authorize_request, except: :create
  	before_action :find_user, except: %i[create index]
    before_action :filter_users, only: :index

  	# GET /users
  	def index
    	render json: @users, status: :ok
  	end

  	# GET /users/:id
  	def show
    	render json: @user, status: :ok
  	end

  	# POST /users
  	def create
    	@user = User.new(user_params)
		if @user.save
      		render json: @user, status: :created
    	else
      		render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    	end
  	end

  	# PUT /users/:id
  	def update
    	unless @user.update(user_params)
      		render json: { errors: @user.errors.full_messages }, status: :unprocessable_entity
    	end
  	end

  	# DELETE /users/:id
  	def destroy
    	@user.destroy
  	end

  	private

    def filter_users
        if params[:filter] == "customers" then
            @users = User.where('user_type = ?', 'customer')
        elsif params[:filter] == 'employee' then
            @users = User.where('user_type = ?', 'employee')
        elsif params[:filter] == 'users' then
            @users = User.where('user_type = ? OR user_type = ? OR user_type = ?', 'admin', 'coordinator', 'employee')
        else
            @users = User.all
        end
    end

  	def find_user
		#@user = User.find_by_username!(params[:_username])
		@user = User.find(params[:id])
    	rescue ActiveRecord::RecordNotFound
      		render json: { errors: 'User not found' }, status: :not_found
	end

  	def user_params
    	params.permit(:name, :last_name, :email, :admin, :phone1, :user_type, :password, :password_confirmation, )
  	end
end
