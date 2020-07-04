class ApplicationController < ActionController::API
	def not_found
		render json: { error: 'Page not found ' }
	end
	
	def authorize_request
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		begin
		  	@decoded = JsonWebToken.decode(header)
		  	@current_user = User.find(@decoded[:user_id])
		rescue ActiveRecord::RecordNotFound => e
		  	render json: { errors: e.message }, status: :unauthorized
		rescue JWT::DecodeError => e
		  	render json: { errors: e.message }, status: :unauthorized
		end
	end


	def admin_permissions
		unless ['admin'].include? @current_user.user_type 
			render json: { errors: 'Unauthorized - You are not admin' }, status: :unauthorized
		end
	end

	def coordinator_permissions
		unless ['admin', 'coordinator'].include? @current_user.user_type
			render json: { errors: 'Unauthorized - You are not a coordinator' }, status: :unauthorized
		end
	end

	def employee_permissions
		unless ['admin', 'coordinator', 'employee'].include? @current_user.user_type
			render json: { errors: 'Unauthorized - You are not a emloyee' }, status: :unauthorized
		end
	end
end
