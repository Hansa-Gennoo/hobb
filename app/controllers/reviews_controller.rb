class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

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
    @event = Event.find(params[:event_id])
    @review = @event.reviews.build(params[:review])
    if @review.save
      redirect_to hobby_event_path, notice: "Review was added successfully!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:event_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, status: :see_other
  end
end
