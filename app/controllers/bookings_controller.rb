class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @event = Event.find(params[:event_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @event = Event.find(params[:event_id])
    @booking.event = @event
    @booking.user = current_user
    @booking.save!
    redirect_to bookings_path, notice: 'Booking was successfully created.'
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    redirect_to bookings_path, notice: 'Booking was successfully destroyed'
  end
end
