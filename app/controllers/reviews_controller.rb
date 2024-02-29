class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @review = Review.new
  end

  def create
    @hobby = Hobby.find(params[:hobby_id])
    @event = @hobby.events.find(params[:event_id])
    @review = current_user.reviews.build(review_params.merge(event: @event))
    if @review.save
      redirect_to hobby_event_path(@event.hobby_id, @event), notice: "Review was added successfully!"
    else
      redirect_back fallback_location: root_path, alert: 'Failed to create review.'
    end
  end

  def destroy
    @hobby = Hobby.find(params[:hobby_id])
    @event = @hobby.events.find(params[:event_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to hobby_event_path(@event.hobby_id, @event), notice: 'Booking was successfully destroyed'
  end

  private

  def review_params
    params.require(:review).permit(:comment)
  end
end
