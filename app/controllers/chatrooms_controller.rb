class ChatroomsController < ApplicationController
  def show
    @hobby = Hobby.find(params[:hobby_id])
    @chatroom = Chatroom.find(params[:id])
    @message = Message.new
  end

  def new
    @hobby = Hobby.find(params[:hobby_id])
    @chatroom = Chatroom.new
    @message = Message.new
  end

  def create
    @hobby = Hobby.find(params[:hobby_id])
    @chatroom = Chatroom.new(hobby_id: @hobby.id)

    if @chatroom.save
      redirect_to hobby_chatroom_path(@hobby, @chatroom), notice: 'Chatroom was successfully created.'
    else
      render 'hobbies/show', status: :unprocessable_entity
    end
  end
end
