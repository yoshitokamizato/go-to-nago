# frozen_string_literal: true

class Users::ConfirmationsController < Devise::ConfirmationsController
  # GET /resource/confirmation/new
  # def new
  #   super
  # end

  # POST /resource/confirmation
  # def create
  #   super
  # end

  # GET /resource/confirmation?confirmation_token=abcdef
  # def show
  #   super
  # end
  # ↓で上書き（デフォルトのコマンドのflashメッセージのみ変更）
  # File 'app/controllers/devise/confirmations_controller.rb', line 22

  def show
    # 会員登録確認後（プロフィールを）のアクション
    self.resource = resource_class.confirm_by_token(params[:confirmation_token])
    yield resource if block_given?
    if resource.errors.empty?
      # ここの部分
      flash[:success] = "会員登録が完了しました。"
      sign_in(@user, bypass: true)
      respond_with_navigational(resource) { redirect_to after_confirmation_path_for(resource_name, resource) }
    else
      flash[:alert] = "リンクの有効期限が切れています。ログインできない場合再登録してください"
      redirect_to user_path
    end
  end

  # protected

  # The path used after resending confirmation instructions.
  # def after_resending_confirmation_instructions_path_for(resource_name)
  #   super(resource_name)
  # end

  # The path used after confirmation.
  # def after_confirmation_path_for(resource_name, resource)
  #   user_path
  # end
  def after_confirmation_path_for(_resource_name, _resource)
    user_path
  end
end
