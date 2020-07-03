class District < ApplicationRecord
	has_many :houses
	has_many :guardas
end
