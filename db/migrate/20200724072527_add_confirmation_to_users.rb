class AddConfirmationToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column  :users,  :confirmation_token,  :string
    add_column  :users,  :confirmed_at,        :datetime
    add_column  :users,  :confirmation_sent_at,:datetime    
    add_column  :users,  :unconfirmed_email,   :string   #email変更時の認証が不要であれば、この項目は不要。ただし、configの「reconfirmable」を「false」にする必要が
  end
end
