class V1::HousesController < ApplicationController
	before_action :authorize_request
	before_action :coordinator_permissions, :valid_customer, :valid_disctrict, only: :create
	before_action :find_house, only: :show
	before_action :get_houses, only: :index
	  

	# POST /houses
	def create
		@house = House.new(house_params)
		if @house.save
			render json: @house, status: :created
		else
			render json: { errors: @house.errors.full_messages }, status: :unprocessable_entity
		end
	end


	# GET /houses
	def index
    	render json: @houses, status: :ok
	end
	  

	# GET /houses/:id
  	def show
    	render json: @house, status: :ok
  	end


	private

	def house_params
    	params.permit(:name, :address, :address_number, :city, :customer_id, :district_id)
	end


	def valid_disctrict
		@district = District.find(params[:district_id])
    	rescue ActiveRecord::RecordNotFound
      		render json: { errors: 'District not found' }, status: :not_found
	end


	def valid_customer

		@customer = User.find(params[:user_id]) if params.has_key?(:user_id)
		@customer = User.find(params[:customer_id]) if params.has_key?(:customer_id)
    	rescue ActiveRecord::RecordNotFound
      		render json: { errors: 'Customer not found' }, status: :not_found
	end


	def find_house
		@house = House.find(params[:id])
    	rescue ActiveRecord::RecordNotFound
      		render json: { errors: 'House not found' }, status: :not_found
	end
	
	
	def get_houses
		if params.has_key?(:district_id)
			valid_disctrict
			@houses = @district.houses
		elsif params.has_key?(:user_id)
			valid_customer
			@houses = @customer.houses
		else
			@houses = @current_user.houses
		end
	end
end
