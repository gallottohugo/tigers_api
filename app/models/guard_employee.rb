class GuardEmployee < ApplicationRecord
	belongs_to  :guard
	belongs_to  :employee, class_name 'User'
end
