class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new(event_params)
  end

  def create
    @event = Event.new
    @event.user = current_user
    if @event.save
      redirect_to event_path, notice: 'Event was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to events_path, notice: 'Event was deleted.'
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :time)
  end
end
