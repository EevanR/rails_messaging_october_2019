class ConversationsController < ApplicationController
  before_action :authenticate_user!

  def new
  end

  def create
    recipients = User.where(id: conversation_params[:recipients])
  if conversation_params[:subject].empty? || conversation_params[:body].empty? || recipients.empty?
      redirect_to request.referer
      flash[:alert] = 'Messages must have a recipient, subject and message!'
    else
      conversation = current_user.send_message(recipients, conversation_params[:body], conversation_params[:subject]).conversation
      flash[:success] = 'Your message was successfully sent!'
      redirect_to conversation_path(conversation)
    end
  end

  def show
    @receipts = conversation.receipts_for(current_user)
    conversation.mark_as_read(current_user)
  end

  def reply
  if message_params[:body].empty?
      redirect_to request.referer
      flash[:alert]= "Your text box is empty!"
    else
      current_user.reply_to_conversation(conversation, message_params[:body])
      flash[:notice] = 'Your reply message was successfully sent!'
      redirect_to conversation_path(conversation)
    end
  end

  def trash
    conversation.move_to_trash(current_user)
    redirect_to mailbox_inbox_path
  end

  def untrash
    conversation.untrash(current_user)
    redirect_to mailbox_inbox_path
  end

  private

  def conversation_params
    params.require(:conversation).permit(:subject, :body, recipients: [])
  end

  def message_params
    params.require(:message).permit(:body, :subject)
  end

end
