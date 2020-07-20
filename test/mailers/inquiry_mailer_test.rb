require 'test_helper'

class InquiryMailerTest < ActionMailer::TestCase
  def inquiry
    inquiry = Inquiry.new(name: "侍 太郎", message: "問い合わせメッセージ")

    InquiryMailer.send_mail(inquiry)
  end
end
