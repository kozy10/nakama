class User::MessagesController < User::UserBase

	before_action :authenticate_user!
  before_action :set_conversation

	def index
    # check if this current_user are involved in conversation
    if current_user == @conversation.sender || current_user == @conversation.recipient
    #current_userがsenderだったら @other = @conversation.recipient 違かったら @other = @conversation.sender
      @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
      @messages = @conversation.messages.order("created_at DESC")
    else
      redirect_to conversations_path, alert: "他人のメッセージにアクセスできません"
    end

  end

  def create
    @message = @conversation.messages.new(message_params)
    @messages = @conversation.messages.order("created_at DESC")

    if @message.save
      @conversation.update_attribute(:latest_message_at, Time.now)
      @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
      #NotificationMailer.send_when_message(current_user, @other, @message).deliver
      redirect_to user_conversation_messages_path(@conversation)
    end
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end