class InquiryMailer < ApplicationMailer

  def send_mail(inquiry)
    @inquiry = inquiry
    mail(
      from: 'system@example.com',
      to: @inquiry.email,
      subject: 'お問い合わせを受け付けました（名護へGO)'
    )
  end

end
