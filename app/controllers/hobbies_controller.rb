class HobbiesController < ApplicationController
  # before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @hobbies = Hobby.all
  end

  def show
    @hobby = Hobby.find(params[:id])
  end

  def new
    @hobby = Hobby.new
    authorize @hobby
  end

  def create
    @hobby = Hobby.new(hobby_params)
    @hobby.user = current_user
    authorize @hobby
    if @hobby.save
      redirect_to hobbies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    authorize @hobby
    @hobby = Hobby.find(params[:id])
    @hobby.destroy
    redirect_to hobbies_path, status: :see_other
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name)
  end
end
