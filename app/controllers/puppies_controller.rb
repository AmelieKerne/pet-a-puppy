class PuppiesController < ApplicationController

  def index
    @puppies = Puppy.all
    authorize @puppy
  end

  def show
    @puppy = Puppy.find(params[:id])
    authorize @puppy
  end

  def new
    @puppy = Puppy.new
  end

  def create
    @puppy = Puppy.new(puppy_params)
    if @puppy.save
      redirect_to puppy_path(@puppy)
    else
      render 'new'
  end

  private

  def puppy_params
    params.require(:puppy).permit(:name, :description, :price)
  end

end
