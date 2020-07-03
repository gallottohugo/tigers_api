class House < ApplicationRecord
	belongs_to :customer, class_name 'User'
	belogns_to :distric
end
