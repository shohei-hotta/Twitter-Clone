class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    @message.save
    redirect_to messages_path, notice: "Tweetしました。"
  end

  def edit
  end

  def show
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
