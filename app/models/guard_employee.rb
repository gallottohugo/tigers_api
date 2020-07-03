class GuardEmployee < ApplicationRecord
	belogns_to :guard
	belogns_to :employee, class_name 'User'
end
