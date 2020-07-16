class InquiriesController < ApplicationController
  def new
    @inquiry = Inquiry.new  unless @inquiry
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)

    # 戻るボタンが押された場合
    if params['back']
      @inquiry.confirming = ''
      render :new
      return
    end

    if @inquiry.confirming.blank? 
      @inquiry.valid?
      render :new
    else
      if @inquiry.save
        flash[:success] = "お問い合わせ受け付けました"
        redirect_to root_url
        # InquiryMailer.send_mail(@inquiry).deliver
      else
        flash[:danger].now = "送信できませんでしました。もう一度入力をお願いします"
        render :new
      end
    end
  end

  private

  def inquiry_params
    params.require(:inquiry).permit(:user_id, :name, :email, :subject, :message, :confirming)
  end
end
