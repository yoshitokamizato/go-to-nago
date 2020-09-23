class Users::Mailer < Devise::Mailer
    helper :application
    include Devise::Controllers::UrlHelpers
    layout 'mailer'
    default template_path: 'devise/mailer'
    def confirmation_instructions(record, token, opts={})
      #record内にユーザ情報が入っていました。そこの"unconfirmed_email"の有無で登録／変更を仕分けます
      #opts属性を上書きすることで、Subjectやfromなどのヘッダー情報を変更することが可能！
      if record.unconfirmed_email != nil
        opts[:subject] = "【名護へGO】メールアドレス変更手続きを完了してください"
      else
        opts[:subject] = "【名護へGO】会員登録完了"
      end
      #件名の指定以外は親を継承
      super
    end
  end