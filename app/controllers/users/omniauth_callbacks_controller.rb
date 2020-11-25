# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]
  
    # callback for twitter
    def twitter
      callback_for(:twitter)
    end
  
    # common callback method
    def callback_for(provider)
      # @user.skip_confirmation!
      @user = User.from_omniauth(request.env["omniauth.auth"])
      unless @user.persisted?
        @user.skip_confirmation!
        @user.save!
      end
      if @user.active?
        sign_in_and_redirect @user, event: :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
      else
        # @user.skip_confirmation!
        # @user.save!
        # session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
        # redirect_to new_user_registration_url(user: @user)
        redirect_to before_sign_up_path(provider: provider, 
                                        uid: @user.uid)
      end
    end
  
    def failure
      redirect_to root_path
    end

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/heartcombo/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end

end
