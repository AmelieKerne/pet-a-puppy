class PuppiesController < ApplicationController

  def index
    @puppies = policy_scope(Puppy)
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
    @puppy.user = current_user
    if @puppy.save
      redirect_to puppy_path(@puppy)
    else
      render 'new'
    end
  end

  private

  def puppy_params
    params.require(:puppy).permit(:name, :description, :price)
  end

end
