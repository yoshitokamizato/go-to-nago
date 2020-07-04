class Menu < ApplicationRecord
  belongs_to :facility, optional: true
  # menuのもっと見るボタンで表示する数を指定(kaminariを使用)
  paginates_per 10
end
