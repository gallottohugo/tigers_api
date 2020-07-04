class V1::DistrictsController < ApplicationController
	before_action :authorize_request
	before_action :coordinator_permissions, only: :create
	before_action :employee_permissions, only: :index
	before_action :find_district, only: :show


	# GET /districts/:id
	def show
    	render json: @district, status: :ok
	end


	def create
		@distric = District.new(distric_params)
		if @distric.save
			render json: @distric, status: :created
		else
			render json: { errors: @distric.errors.full_messages }, status: :unprocessable_entity
		end
	end


	def index
		render json: District.all, status: :ok
	end
	  

	private 

	def distric_params
    	params.permit(:name)
	end

	
	def find_district
		@district = District.find(params[:id])
    	rescue ActiveRecord::RecordNotFound
      		render json: { errors: 'District not found' }, status: :not_found
	end
end
