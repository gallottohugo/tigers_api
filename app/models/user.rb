class User < ApplicationRecord
	USER_TYPE_OPTIONS = ['admin', 'coordinator', 'customer', 'employee' ]

	
	has_secure_password
  	validates :email, presence: true, uniqueness: true
  	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
	validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
	validates :user_type, :inclusion =>  { in: USER_TYPE_OPTIONS }
	
	
	has_many :houses, foreign_key: :customer_id
	has_many :guard_employees, foreign_key: :employee_id
end
