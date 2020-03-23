class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :show, :destroy]

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
  end

  def update
    if @message.update(message_params)
      redirect_to messages_path, notice: "Tweetを編集しました"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @message.destroy
    redirect_to messages_path, notice: "Tweetを削除しました"
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end

  def set_message
    @message = Message.find(params[:id])
  end
end
