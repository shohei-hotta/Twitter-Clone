class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to messages_path, notice: "Tweetしました。"
    else
      render :new
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def update
    @message = Message.find(params[:id])
    if @message.update(message_params)
      redirect_to messages_path, notice: "Tweetを編集しました"
    else
      render :edit
    end
  end

  def show
    @message = Message.find(params[:id])
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

end
