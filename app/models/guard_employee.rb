class GuardEmployee < ApplicationRecord
	belongs_to  :guard
	belongs_to  :employee, :class_name => 'User', :foreign_key => 'employee_id', :validate => true
end
