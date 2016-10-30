class User < ApplicationRecord
   TEMP_EMAIL_PREFIX = 'cambia@me'
   TEMP_EMAIL_REGEX = /\Achange@me/
  # Include default devise modules. Others available are:
  # , :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :lastseenable,
         :confirmable, :omniauthable, omniauth_providers: [:facebook]
   validates_presence_of :username
   validates_uniqueness_of :username
   validates_uniqueness_of :email
   validates_presence_of :name
   validates_presence_of :last_name

   def self.from_omniauth(auth, signed_in_resource = nil)

      identity = Identity.find_for_oauth(auth)
      user = signed_in_resource ? signed_in_resource : identity.user
      if user.nil?
         email_is_verified = auth.info.email && (auth.info.verified || auth.extra.raw_info.is_verified)
         email = auth.info.email if email_is_verified
         user = User.where(:email => email).first if email

         if user.nil?
            user = User.new(
               email: email,
               password: Devise.friendly_token[0,20],
               username: Devise.friendly_token[0,10],
               name: auth[:info][:first_name],
               last_name: auth[:info][:last_name]
            )
            user.skip_confirmation!
            user.save!
         end
      end

      if identity.user != user
         identity.user = user
         identity.save!
      end
      
      user
      
   end

   def email_verified?
      self.email && self.email !~ TEMP_EMAIL_REGEX
   end
end
