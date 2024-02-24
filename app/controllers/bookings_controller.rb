class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @event = Event.find(params[:event_id])
    @booking = Booking.new
  end

  def create
    @hobby = Hobby.find(params[:hobby_id])
    @event = @hobby.events.find(params[:event_id])
    @booking = current_user.bookings.build(event: @event)

    if @booking.save!
      redirect_to hobby_event_bookings_path, notice: 'Booking was successfully created.'
    else
      redirect_back fallback_location: root_path, alert: 'Failed to create booking.'
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path, notice: 'Booking was successfully destroyed'
  end
end
