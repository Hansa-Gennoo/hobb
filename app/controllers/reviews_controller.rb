class ReviewsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new
    if @review.save
      redirect_to reviews_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path, status: :see_other
  end
end
