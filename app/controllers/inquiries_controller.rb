class InquiriesController < ApplicationController

  NEW_SUBJECT = "情報掲載依頼"
  NEW_MESSAGE = <<-TEXT 
    情報掲載を希望される施設の情報を、記載してください。
    ＝＝＝＝＝＝＝＝＝＝＝＝
    施設名：
    郵便番号、住所：
    電話番号：
    URL:
    定休日：
    営業時間：
    メニュー：
    駐車場：
    TEXT
  EDIT_SUBJECT = "情報修正依頼"
  EDIT_MESSAGE = <<-TEXT 
    情報掲載を希望される施設の情報を、記載してください。
    ＝＝＝＝＝＝＝＝＝＝＝＝
    修正が必要な項目：
    正しい情報内容：
    TEXT
  
  def new
    @inquiry = Inquiry.new # unless @inquiry
    @inquiry.kind = params[:kind].to_i if params[:kind]
    @inquiry.facility_id = params[:facility_id].to_i  if params[:facility_id]
    debugger
    case @inquiry.kind 
    when "new_facility"
      @inquiry.subject = NEW_SUBJECT
      @inquiry.message = NEW_MESSAGE
    when "edit_facility"
      facility_name = @inquiry.facility.name
      @inquiry.subject = EDIT_SUBJECT + "(#{facility_name})"
      @inquiry.message = EDIT_MESSAGE
    end
  end

  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    debugger
    render :new if @inquiry.invalid?
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    debugger
    # 戻るボタンが押された場合
    if params["back"]
      render :new
    elsif @inquiry.save
      flash.now[:success] = "お問い合わせを受け付けました"
      # redirect_to root_url
      # メール送信
      # InquiryMailer.send_mail(@inquiry).deliver_later
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
