# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  # 上書きすることでresourceがうまく渡せるように（defaultのbefore_actionが原因）
  prepend_before_action :authenticate_scope!, only: %i[edit edit_password edit_email update update_password update_email destroy]
  prepend_before_action :set_minimum_password_length, only: %i[new edit edit_password]
  before_action :configure_sign_up_params, only: [:create]

  #  before_action :check_login, only: [:temp]

  # GET /resource/sign_up
  def new
    build_resource
    yield resource if block_given?
    respond_with resource
  end

  # 仮登録時にプロフィールを編集するアクション
  def regist
    # 引数のresourceを使ってユーザーを取得
    # メール認証から来た時と戻るボタンから来た時で場合わけ(paramsが違うため)
    # 確認メールから編集画面に来た時
    if params["resource"]
      @user = User.find(params["resource"])
      # 初回登録か、既に会員登録済みかを場合わけ
      if @user.nickname.present? || @user.prefecture.present? || @user.sex.present? || @user.birth_year.present? || @user.image.present? || @user.profile.present? || @user.mailmagazine.present?
        # 既に会員登録されている場合
        flash[:alert] = "このメールアドレスは既に登録されています。ログインしてください。"
        redirect_to new_user_session_path
      else
        # 初回登録の場合
        @token = params["confirmation_token"]
      end
    # 確認画面から編集画面に戻った時
    elsif params["user"]
      @user = User.find(params["user"]["user_id"])
      @user.nickname = params["user"]["nickname"]
      @user.prefecture = params["user"]["prefecture"]
      @user.sex = params["user"]["sex"]
      @user.birth_year = params["user"]["birth_year"]
      @user.image = params["user"]["image"]
      @user.profile = params["user"]["profile"]
      @user.mailmagazine = params["user"]["mailmagazine"]
      @token = params["user"]["confirmation_token"]
    end
  end

  # registアクションの内容を表示して確認するアクション
  def confirm
    @user = User.find(params["user"]["user_id"])
    # 初回登録か、既に会員登録済みかを場合わけ
    if @user.nickname.present? || @user.prefecture.present? || @user.sex.present? || @user.birth_year.present? || @user.image.present? || @user.profile.present? || @user.mailmagazine.present?
      # 既に会員登録されている場合
      flash[:alert] = "このメールアドレスでは既に登録されています。ログインしてください。"
      redirect_to new_user_session_path
    else
      # 初回登録の場合
      @user.nickname = params["user"]["nickname"]
      @user.prefecture = params["user"]["prefecture"]
      @user.sex = params["user"]["sex"]
      @user.birth_year = DateTime.parse(params["user"]["birth_year(1i)"] + "-01-01 00:00:00")
      @user.image = params["user"]["image"]
      @user.profile = params["user"]["profile"]
      @user.mailmagazine = params["user"]["mailmagazine"]

      @token = params["confirmation_token"]
      if @user.valid?
        render action: "confirm"
        flash.now[:success] = "確認して完了してください"
      else
        render action: "regist"
        flash.now[:alert] = "失敗しました"
      end
    end
  end

  # プロフィールを保存し、認証トークンを受理することで登録を完了するアクション
  def registcomp
    @user = User.find(params["user"]["user_id"])
    # 初回登録か、既に会員登録済みかを場合わけ
    if @user.nickname.present? || @user.prefecture.present? || @user.sex.present? || @user.birth_year.present? || @user.image.present? || @user.profile.present? || @user.mailmagazine.present?
      # 既に会員登録されている場合
      redirect_to new_user_session_path
      flash[:alert] = "このメールアドレスでは既に登録されています。ログインしてください。"
    else
      # 初回登録の場合
      @user.nickname = params["user"]["nickname"]
      @user.prefecture = params["user"]["prefecture"]
      @user.sex = params["user"]["sex"]
      @user.birth_year = params["user"]["birth_year"]
      @user.image = params["user"]["image_cache"]
      @user.profile = params["user"]["profile"]
      @user.mailmagazine = params["user"]["mailmagazine"]

      # userのアクティブ状況をactiveに変更
      @user.status = 1
      @token = params["confirmation_token"]
      if @user.valid?
        @user.save
        #  confirmation_pathにuserデータと認証トークンを付与することで本会員登録される
        redirect_to confirmation_path(@user, confirmation_token: @token)
        sign_in(@user, bypass: true)
      else
        render action: "before_create"
        flash.now[:alert] = "会員登録に失敗しました。再登録してください"
      end
    end
  end

  # POST /resource
  def create
    super do # 他はdeviseの機能をそのまま流用する
      #      resource.update(confirmed_at: Time .now.utc)       # Welcomeメールを送信した上で、skip_confirmation!と同一処理を行い自動で認証クローズさせる
      # ↓と同じ意味(登録時にメール認証を行わない設定)
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

  # email 編集ページのためのメソッド
  def edit_email
    resource
  end

  # updateアクションのデフォルトから引用し変更
  def update_password
    user = current_user
    # 入力した現在のパスワードが有効 かつ 新しいパスワードが以前と同じでないかのフィルター
    if user.valid_password?(update_password_params[:current_password]) && update_password_params[:password] != update_password_params[:current_password]
      user.password = update_password_params[:password]
      user.password_confirmation = update_password_params[:password_confirmation]
      if user.save
        bypass_sign_in(current_user)
        redirect_to user_path
        flash[:success] = "パスワードを更新しました。"
      end
    #  以前と同じパスワードを入力した場合のアクション
    elsif update_password_params[:password] == update_password_params[:current_password]
      clean_up_passwords resource
      redirect_to users_edit_password_path
      flash[:danger] = "新しいパスワードを入力してください"
    # それ以外のエラー時のアクション
    else
      clean_up_passwords resource
      redirect_to users_edit_password_path
      flash[:danger] = "パスワードの更新に失敗しました。"
    end
  end

  def update_email
    self.resource = resource_class.to_adapter.get!(send(:"current_#{resource_name}").to_key)
    prev_unconfirmed_email = resource.unconfirmed_email if resource.respond_to?(:unconfirmed_email)

    resource_updated = update_resource(resource, account_update_params)
    yield resource if block_given?
    if resource_updated
      set_flash_message_for_update(resource, prev_unconfirmed_email)
      bypass_sign_in resource, scope: resource_name if sign_in_after_change_password?
      if resource.unconfirmed_email.nil?
        flash[:danger] = "メールアドレスを変更してください"
        redirect_to users_edit_email_path
      else
        redirect_to users_update_email_confirm_path(unconfirmed_email: resource.unconfirmed_email)
      end
    else
      flash[:danger] = "メールアドレスの更新に失敗しました"
      redirect_to users_edit_email_path
    end
  end

  def update_email_confirm
    @unconfirmed_email = params[:unconfirmed_email]
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

  # def temp
  #   @user = params["resource"]
  # end

  protected

  # 更新（編集の反映）時にパスワード入力を省く
  def update_resource(resource, params)
    if params[:password].blank? && params[:password_confirmation].blank? && params[:current_password].blank?
      resource.update_without_password(params)
    else
      resource.update_with_password(params)
    end
  end

  # 更新後のパスを指定
  def after_update_path_for(_resource)
    user_path
  end

  # password変更時のparamsを読み込む
  def update_password_params
    params.require(:user).permit(:attribute, :password, :password_confirmation, :current_password)
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end
end
