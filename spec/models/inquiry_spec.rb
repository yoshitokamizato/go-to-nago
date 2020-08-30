require 'rails_helper'

RSpec.describe Inquiry, type: :model do
  before:context do
    cnt = User.count
    @user = User.create(
      email: "test-#{cnt+1}@example.com",
      nickname: "hanako",
      sex: 0,
      role: 0,
      status: 1,
      prefecture: 6,
      password: 'password',
      birth_year: DateTime.now,
      confirmed_at: Time.now
    )
    puts @user.valid?
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

  describe 'method default_set' do
    context 'argument kind is set to 0(inquiry)' do
      before do
        kind = "0"
        @inquiry = Inquiry.new
        @inquiry.default_set(kind, nil)
      end

      it "has subject with nil as default data" do
        expect(@inquiry.subject).to be nil
      end

      it "has message with nil as default data" do
        expect(@inquiry.message).to be nil
      end

    end

    context 'argument kind is set to 1(new_facility)' do
      before do
        kind = "1"
        @inquiry = Inquiry.new
        @inquiry.default_set(kind, nil)
      end

      it "has subject with '情報掲載依頼' as default data" do
        expect(@inquiry.subject).to eq '情報掲載依頼'
      end

      it "has message included '情報掲載を希望される' as default data" do
        expect(@inquiry.message).to include('情報掲載を希望される')
      end
    end

    context 'argument kind is set to 2(edit_facility)' do
      before do
        kind = "2"
        @inquiry = Inquiry.new
        @facility = Facility.create(
          type: 0,
          name: "おきなわさんぽ",
          postal_code: "9050017",
          address: "おきなわ",
          latitude: "26.593",
          longitude: "127.78",
          description: "おいしい",
          parking: "なし",
          created_user: @user.id,
          updated_user: @user.id,
          owner_id: @user.id,
          user_id: @user.id
        )
        @facility.valid?
        # puts @facility.errors.full_messages
        # puts "facility_id : #{@facility.id},  facility_name : #{@facility.name} "
        @inquiry.default_set(kind, @facility.id)
      end

      it "has subject with '情報修正依頼(#施設の名前)' as default data" do
        expect(@inquiry.subject).to eq "情報修正依頼(#{@facility.name})"
      end

      it "has message included '修正が必要な情報' as default data" do
        expect(@inquiry.message).to include('修正が必要な情報')
      end

      it "has facility_id passed by argument(facility_id) " do
        expect(@inquiry.facility_id).to eq @facility.id
      end
    end

    context 'argument current_user is set' do
      before do
        kind = ["0", "1", "2"].sample
        @inquiry = Inquiry.new
        @facility = Facility.create(
          type: 0,
          name: "おきなわさんぽ",
          postal_code: "9050017",
          address: "おきなわ",
          latitude: "26.593",
          longitude: "127.78",
          description: "おいしい",
          parking: "なし",
          created_user: @user.id,
          updated_user: @user.id,
          owner_id: @user.id,
          user_id: @user.id
        )
        @inquiry.default_set(kind, @facility.id, @user)
      end
 
      it "has correct user_id passed by argument(current_user)" do
        expect(@inquiry.user_id).to eq @user.id
        expect(@inquiry.email).to eq @user.email
      end
 
      it "has correct name passed by argument(current_user)" do
        expect(@inquiry.name).to eq @user.nickname
      end
 
      it "has correct email passed by argument(current_user)" do
        expect(@inquiry.email).to eq @user.email
      end
    end
  end
end
