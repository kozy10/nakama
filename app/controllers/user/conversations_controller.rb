class User::ConversationsController < User::UserBase
before_action :authenticate_user!

def index
  @user = User.all
  # get all conversations involving current_user
  @conversations = Conversation.involving(current_user)
end

def create
  if Conversation.between(params[:sender_id], params[:recipient_id]).present?
    # Conversationデーブルの先頭のレコードを取得する。一番最新のメッセージを取得するためにbetweenメソッドが必要？
    @conversation = Conversation.between(params[:sender_id], params[:recipient_id]).first
  else
    @conversation = Conversation.create(conversation_params)
  end
  redirect_to user_conversation_messages_path(@conversation)
end

private
  def conversation_params
    params.permit(:sender_id, :recipient_id)
  end
end