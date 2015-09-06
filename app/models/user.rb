class User < ActiveRecord::Base
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable and :omniauthable
	devise 	:database_authenticatable,
			:registerable,
			:recoverable, 
			:rememberable, 
			:trackable, 
			:validatable, 
			:omniauthable, :omniauth_providers => [:facebook]

	has_many :authorizations

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

	def self.new_with_session(params,session)
		if session["devise.user_attributes"]
		  new(session["devise.user_attributes"],without_protection: true) do |user|
		    user.attributes = params
		    user.valid?
		  end
		else
		  super
		end
	end

	def self.from_omniauth(auth, current_user)
		authorization = Authorization.where(:provider => auth.provider, :uid => auth.uid.to_s, :token => auth.credentials.token, :secret => auth.credentials.secret).first_or_initialize
		@authorization = authorization

		if authorization.user.blank?
		  user = current_user || User.where('email = ?', auth["info"]["email"]).first

		  if user.blank?
		   user = User.new
		   user.password = Devise.friendly_token[0,10]
		   user.name = auth.info.name
		   user.first_name = auth.info.first_name
		   user.last_name =  auth.info.last_name
		   user.images = auth.info.image
		   user.uid = auth.uid.to_s
		   #first_name, :middle_name, :last_name, :home_phone, :mobile_phone, :email, :password
		   user.email = auth.info.email
		   user.save(:validate => false)
		 end
		 authorization.username = auth.info.nickname
		 authorization.user_id = user.id
		 authorization.save
		end
		authorization.user
	end
end