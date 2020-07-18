class ChatroomsController < ApplicationController

  def index
    @chatrooms = Chatroom.all
  end

  def show
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @chatroom = Chatroom.new
  end

  def create
    recipient = User.find(params[:recipient_id].to_i)
    sender = User.find(params[:sender_id].to_i)

    @chatroom = Chatroom.new(sender_id: sender.id, recipient_id: recipient.id)
    if @chatroom.save
      redirect_to chatroom_path(@chatroom)
    else
      render :new
    end
  end


  private

  # def chatroom_params
  #   params.require(:chatroom).permit(:name)
  # end
end
