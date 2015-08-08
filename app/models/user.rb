class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise 	:database_authenticatable, 
			:registerable,
			:recoverable, 
			:rememberable, 
			:trackable, 
			:validatable

	#attr_accessor :email, :password, :encrypted_password, :password_confirmation, :first_name, :middle_name, :last_name, :home_phone, :mobile_phone

	before_save :encrypt_password

	validates_confirmation_of :encrypted_password
	validates_presence_of 	:encrypted_password, 	:on => :create
	validates_presence_of 	:email,    	:on => :create
	validates_uniqueness_of :email

	def encrypt_password
		if password.present?
			salt = BCrypt::Engine.generate_salt
			encrypted_password = BCrypt::Engine.hash_secret(password, salt)
		end
	end
end