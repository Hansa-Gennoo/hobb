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
  end

  def create
    @hobby = Hobby.new(hobby_params)
    if @hobby.save
      redirect_to hobbies_path(@hobby)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @hobby = Hobby.find(params[:id])
    @hobby = Hobby.destroy
    redirect_to hobbies_path, status: :see_other
  end

  private

  def hobby_params
    params.require(:hobby).permit(:name)
  end
end
