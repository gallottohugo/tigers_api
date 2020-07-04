class House < ApplicationRecord

	validates :customer_id, presence: true
	validates :district_id, presence: true


	belongs_to  :user, optional: true
	belongs_to  :distric, optional: true
end
