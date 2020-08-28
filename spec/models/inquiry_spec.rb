require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  before do
    @user = User.create(
      email: "test@example.com",
      nickname: "hanako",
      sex: 0,
      role: 0,
      status: 1,
      prefecture: 6,
      confirmed_at: Time.now
    )
  end

  describe "data validation" do
    it "is invalid without a name" do
      inquiry = Inquiry.new(name: nil)
      inquiry.valid?
      expect(inquiry.errors[:name]).to include("を入力してください")
    end

    it "is invalid with a name longer than 50" do
      inquiry = Inquiry.new(name: 'a'*51 )
      inquiry.valid?
      expect(inquiry.errors[:name]).to include("は50文字以内で入力してください")
    end

    it "is invalid with a subject longer than 100" do
      inquiry = Inquiry.new(subject: 'a'*101 )
      inquiry.valid?
      expect(inquiry.errors[:subject]).to include("は100文字以内で入力してください")
    end

    it "is invalid without a email" do
      inquiry = Inquiry.new(email: nil)
      inquiry.valid?
      expect(inquiry.errors[:email]).to include("を入力してください")
    end

    it "is invalid with a email longer than 254" do
      inquiry = Inquiry.new(email: 'a'*255 )
      inquiry.valid?
      expect(inquiry.errors[:email]).to include("は254文字以内で入力してください")
    end

    it "is invalid with a email included invalid value (case 1)" do
      inquiry = Inquiry.new(email: '%test@example.com' )
      inquiry.valid?
      expect(inquiry.errors[:email]).to include("は不正な値です")
    end

    it "is invalid with a email included invalid value (case 2)" do
      inquiry = Inquiry.new(email: 'testexample.com' )
      inquiry.valid?
      expect(inquiry.errors[:email]).to include("は不正な値です")
    end

    it "is invalid with a email included invalid value (case 3)" do
      inquiry = Inquiry.new(email: 'test@examplecom' )
      inquiry.valid?
      expect(inquiry.errors[:email]).to include("は不正な値です")
    end

    it "is invalid without a message" do
      inquiry = Inquiry.new(message: nil)
      inquiry.valid?
      expect(inquiry.errors[:message]).to include("を入力してください")
    end

    it "is invalid with a message longer than 1000" do
      inquiry = Inquiry.new(message: 'a'*1001 )
      inquiry.valid?
      expect(inquiry.errors[:message]).to include("は1000文字以内で入力してください")
    end
  end
end
