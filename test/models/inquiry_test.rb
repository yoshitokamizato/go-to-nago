require "test_helper"

class InquiryTest < ActiveSupport::TestCase
  def setup
    @inquiry = Inquiry.new(
      name: "ExampleUser",
      subject: "お問い合わせ",
      email: "user@example.com",
      message: <<-TEXT
        Lorem ipsum dolor sit amet, consectetur adipisicing elit,
        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
        複素数体であれば、任意のCM-タイプの A は、実際、数体である定義体（英語版）
        (field of definition)を持っている。
        TEXT
    )

    @user = User.new(
      email: "user@example.text",
      password: "hogehoge",
      nickname: "hoge",
      birth_year: 2020,
      prefecture: 1,
      role: 0,
      status: 1
    )
  end

  test "正常：user_idなし" do
    assert @inquiry.valid?
  end

  test "正常：user_idあり" do
    @inquiry.user_id = 1
    assert @inquiry.valid?
  end

  test "エラー:nameが空" do
    @inquiry.name = nil
    assert @inquiry.invalid?
  end

  test "エラー:nameが最大長超え" do
    @inquiry.name = "a" * 51
    # puts @inquiry.name
    assert @inquiry.invalid?
    # puts @inquiry.errors.full_messages
  end

  test "エラー:emailが空" do
    @inquiry.email = nil
    assert @inquiry.invalid?
  end

  test "エラー:emailのフォーマットが不正" do
    @inquiry.email = "abcd@abc"
    assert @inquiry.invalid?
  end

  test "エラー:emailが最大長超え" do
    @inquiry.email = "a" * 250 + "@a.com"
    # puts @inquiry.email
    assert @inquiry.invalid?
    # puts @inquiry.errors.full_messages
  end

  test "エラー:subjectが最大長超え" do
    @inquiry.subject = "a" * 101
    assert @inquiry.invalid?
    # puts @inquiry.errors.full_messages
  end

  test "エラー:messageが空" do
    @inquiry.message = nil
    assert @inquiry.invalid?
  end

  test "エラー:messageが最大長超え" do
    @inquiry.subject = "a" * 1001
    assert @inquiry.invalid?
    # puts @inquiry.errors.full_messages
  end
end
