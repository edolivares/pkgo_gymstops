class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end
  
  layout 'login_regis'
   def facebook
      # Si el usuario no permite el correo, se vuelve a solicitar hasta que lo entrega
      if request.env["omniauth.auth"].info.email.blank?
         redirect_to "/auth/facebook?auth_type=rerequest&scope=email"
      end
      # Si la cuenta de facebook no está verificada, no se deja ingresar
      if request.env["omniauth.auth"].info.verified == false
         redirect_to login_path, alert: 'Su cuenta de facebook no está validada. Por favor confirme su cuenta antes de continuar.'
         return
      end

      @user = User.from_omniauth(request.env["omniauth.auth"], current_user)

      if @user.persisted?
         @user.remember_me = true
         sign_in_and_redirect @user, event: :authentication
         set_flash_message(:notice, :success, kind: "Facebook") if is_navigational_format?
      else
         session["devise.auth"] = request.env["omniauth.auth"]
         redirect_to new_user_registration_url
      end
   end

   def completar_registro
      @user= User.from_omniauth(session["devise.auth"])
      if @user.update(user_params)
         sign_in_and_redirect @user, event: :authentication
      else
         render :edit
      end
   end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

   private

      def user_params
         params.require(:user).permit(:name, :last_name, :username, :comuna_id)
      end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
end
