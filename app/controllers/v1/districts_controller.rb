class V1::DistrictsController < ApplicationController
	before_action :authorize_request
	#before_action :employee_permissions, only: :houses
	before_action :find_district, only: [ :houses, :show ]


	def houses
		render json: @district.houses, status: :ok
	end

	# GET /districts/:id
	def show
    	render json: @district, status: :ok
	end
	  

	private 

	def find_district
		@district = District.find(params[:id])
    	rescue ActiveRecord::RecordNotFound
      		render json: { errors: 'District not found' }, status: :not_found
	end
end
