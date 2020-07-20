class V1::GuardsController < ApplicationController
	before_action :authorize_request
	before_action :coordinator_permissions, :valid_disctrict, only: :create


	def create
		@guard = Guard.new(guard_params)
		if @guard.save
			 params[:employees].split(",").map(&:to_i).each do |item|
				valid_employee(item)
				GuardEmployee.create(guard_id: @guard.id, employee_id: @employee.id)
			end
			render json: @guard, status: :created
		else
			render json: { errors: @distric.errors.full_messages }, status: :unprocessable_entity
		end
	end

	private

	def guard_params
    	params.permit(:date, :start, :end, :district_id)
	end

	def valid_disctrict
		@district = District.find(params[:district_id])
    	rescue ActiveRecord::RecordNotFound
      		render json: { errors: 'District not found' }, status: :not_found
	end

	def valid_employee(employee_id)
		@employee = User.find(employee_id)
    	rescue ActiveRecord::RecordNotFound
      		render json: { errors: 'Employee not found' }, status: :not_found
	end
end
