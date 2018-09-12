class Message < ApplicationRecord
	belongs_to :conversation
  belongs_to :user

  def message_time
    created_at.strftime("%Y年%m月%d日")
  end
end
