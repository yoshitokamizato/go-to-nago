class InquiriesController < ApplicationController

  def new
    @inquiry = Inquiry.new
    @inquiry.default_set(params[:kind], params[:facility_id], current_user)
    # debugger
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    # debugger
    render :new if @inquiry.invalid?
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    # debugger
    # 戻るボタンが押された場合
    if params["back"]
      render :new
    elsif @inquiry.save
      flash.now[:success] = "お問い合わせを受け付けました"
      # メール送信
      InquiryMailer.send_mail(@inquiry).deliver_later
    else
      flash.now[:danger].now = "お問い合わせ送信に失敗しました"
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:user_id, :name, :email, :subject, :message, :kind, :facility_id)
  end


end
