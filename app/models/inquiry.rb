class Inquiry < ApplicationRecord
  # belongs_to :user, optional: true, counter_cache: true
  belongs_to :facility, optional: true
  enum status: { not_started: 0, in_progress: 1, done: 9 }, _prefix: true
  enum kind: {inquiry: 0, new_facility:1, edit_facility:2}, _prefix: true

  validates :name, presence: true, length: { maximum: 50 }
  validates :subject, length: { maximum: 100 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 254 },
                    format: { with: VALID_EMAIL_REGEX }
  validates :message, presence: true, length: { maximum: 1000 }

  NEW_SUBJECT = "情報掲載依頼"
  NEW_MESSAGE = <<~TEXT 
    情報掲載を希望される施設の情報
    ---------------------------------
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
  EDIT_MESSAGE = <<~TEXT 
    修正が必要な情報
    ---------------------------------
    修正が必要な項目：
    正しい情報内容：
    TEXT

  def default_set(kind, facility_id, current_user=nil)
    self.kind = kind.to_i if kind
    self.facility_id = facility_id.to_i if facility_id
    # debugger
    case self.kind 
    when "new_facility"
      self.subject = NEW_SUBJECT
      self.message = NEW_MESSAGE
    when "edit_facility"
      facility_name = Facility.find(self.facility_id).name
      self.subject = EDIT_SUBJECT + "(#{facility_name})"
      self.message = EDIT_MESSAGE
    end
    if current_user
      self.user_id = current_user.id
      self.name = current_user.nickname
      self.email = current_user.email
    end
  end
end
