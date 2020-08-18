class PuppiesController < ApplicationController
before_action :set_puppy, only: [:show, :edit, :update, :destroy]

  def index
    @puppies = Puppy.all
    authorize @puppy
  end

  def show
    authorize @puppy
  end

  def new
    @puppy = Puppy.new
    authorize @puppy

  end

  def create
    @puppy = Puppy.new(puppy_params)
    if @puppy.save
      redirect_to puppy_path(@puppy)
    else
      render 'new'
    end
  end

  def edit
    authorize @puppy
  end

  def update
  if @puppy.update(puppy_params)
  redirect_to puppy_path(@puppy)

  end

  private

  def set_puppy
    @puppy = Puppy.find(params[:id])
  end

  def puppy_params
    params.require(:puppy).permit(:name, :description, :price)
  end

end
