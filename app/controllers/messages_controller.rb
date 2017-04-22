class MessagesController < ApplicationController
  before_action :set_message, only:[:show, :edit ,:update,:destroy
  ]
  
  def index
    @messages = Message.all
  end

  def show
      # @message = Message.find(params[:id])
  end

  def new
      @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
        flash[:success] = 'messageが正常に投稿されました'
        redirect_to @message
    else
        flash.now[:danger] = 'messageが正常に投稿されまsenndesita'
        render :new
    end
  end

  def edit
      # @message = Message.find(params[:id])
  end

  def update
      # @message = Message.find(params[:id])
      if @message.update(message_params)
          flash[:success] = 'Message update success'
          redirect_to @message
      else
          flash.now[:danger] = "Message dont update "
          render :edit
      end
  end

  def destroy
      # @message = Message.find(params[:id])
      @message.destroy
      flash[:success] = 'Message delete success'
      redirect_to messages_url
      
  end
  
  
  private
  def set_message
    @message = Message.find(params[:id])
  end
  
  def message_params
      params.require(:message).permit(:content, :title)
  end
  
end
