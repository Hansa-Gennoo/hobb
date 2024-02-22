class ChatroomsController < ApplicationController
  def show
    @hobby = Hobby.find(params[:hobby_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end
end
