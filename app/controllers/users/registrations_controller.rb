# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  
  # GET /resource/sign_up
  # def new
  #   super
  # end
  
  # POST /resource
  def create
    super do                                             # 他はdeviseの機能をそのまま流用する
      resource.update(confirmed_at: Time .now.utc)       # Welcomeメールを送信した上で、skip_confirmation!と同一処理を行い自動で認証クローズさせる
      #↓と同じ意味(登録時にメール認証を行わない設定)
      # resource.skip_confirmation!
      # resource.save
      
      # deviseは認証済みかどうかの判断をconfirmed_atに日付が入っているかどうかで判定しているようです。
      # そのため、confirmable機能でメールを送信した上で、confirmed_atに値を入れて自己完結させてる
    end
  end
  
  # GET /resource/edit
  # def edit
  #   super
  # end
  # passwordを編集
  def edit_password
    @user = current_user
  end
  
  # updateアクションのデフォルトから引用し変更
  def update_password
    user = current_user
    if user.valid_password?(update_password_params[:current_password])
      user.password = update_password_params[:password]
      user.password_confirmation = update_password_params[:password_confirmation]
      if user.save
        bypass_sign_in(current_user)
        redirect_to user_path
        flash[:success] = "パスワードを更新しました"
      end
    else
      clean_up_passwords resource
      redirect_to users_edit_password_path
      flash[:danger] = "パスワードの更新に失敗しました"
    end
  end
  # PUT /resource
  # def update
  #   super
  # end
  
  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  # 更新（編集の反映）時にパスワード入力を省く
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # 更新後のパスを指定
  def after_update_path_for(_resource)
    user_path
  end
  # password変更時のparamsを読み込む
  def update_password_params
    params.require(:user).permit(:attribute,:password,:password_confirmation ,:current_password)
  end
  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
