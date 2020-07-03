class User < ApplicationRecord
	has_secure_password
  	validates :email, presence: true, uniqueness: true
  	validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  	validates :username, presence: true, uniqueness: true
	validates :password, length: { minimum: 6 }, if: -> { new_record? || !password.nil? }
	  
	has_many :houses, foreign_key: :customer_id
	has_many :guard_employees, foreign_key: :employee_id
end
