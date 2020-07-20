class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new  #unless @inquiry
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    render :new if @inquiry.invalid?
  end
  
  def create
    @inquiry = Inquiry.new(inquiry_params)
    # 戻るボタンが押された場合
    if params['back']
      render :new
    elsif @inquiry.save
      flash[:success] = "お問い合わせを受け付けました"
      redirect_to root_url
      # メール送信
      # InquiryMailer.send_mail(@inquiry).deliver
    else
      flash.now[:danger].now = "お問い合わせ送信に失敗しました"
      render :new
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:user_id, :name, :email, :subject, :message)
  end
end
