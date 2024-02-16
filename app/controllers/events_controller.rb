class EventsController < ApplicationController

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @hobby = Hobby.find(params[:hobby_id])
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.hobby_id = params[:hobby_id]
    if @event.save
      redirect_to hobby_event_path(@event.hobby_id, @event), notice: 'Event was successfully created!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.hobby_id = params[:hobby_id]
    @event.update(event_params)
    redirect_to hobby_events_path
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to hobby_events_path, notice: 'Event was deleted.'
  end

  private

  def event_params
    params.require(:event).permit(:name, :location, :date, :time)
  end
end
