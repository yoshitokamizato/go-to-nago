# frozen_string_literal: true

class Users::PasswordsController < Devise::PasswordsController
  # パスワード再設定時、ルートにリダイレクトしてしまうのを回避
  prepend_before_action :require_no_authentication, only: [:cancel]
  # GET /resource/password/new
  # def new
  #   super
  # end

  # POST /resource/password
  # def create
  #   super
  # end

  # GET /resource/password/edit?reset_password_token=abcdef
  # def edit
  #   super
  # end

  # PUT /resource/password
  def update
    super
  end

  # protected

  def after_resetting_password_path_for(_resource)
    Devise.sign_in_after_reset_password ? new_user_session_path : new_user_session_path
  end

  # パスワード変更メール送信後のパスを設定
  def after_sending_reset_password_instructions_path_for(_resource_name)
    new_user_session_path if is_navigational_format?
  end
end
