class Guard < ApplicationRecord
	belongs_to :district
	has_many :guard_employees
end
