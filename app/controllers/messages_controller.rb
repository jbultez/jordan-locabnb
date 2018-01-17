class MessagesController < ApplicationController

  before_action :authentificate_user!
  before_action :set_conversation

  def index
    if current_user == @conversation.sender || current_user == @conversation.recipient_id
      @other = current_user == @conversation.sender ? @conversation.recipient : @conversation.sender
      @messages = @conversaton.messages.order("created_at DESC")
    else
      redirect_to conversations_path, alert: "Vous n'avez pas l'autorisation d'accéder à cette page."
    end
  end

  def create
    @message = @conversation.messages.new(message_params)
    @messages = @conversation.messages.order("created_at DESC")

    if @messages.save
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:content, :user_id)
  end
end
