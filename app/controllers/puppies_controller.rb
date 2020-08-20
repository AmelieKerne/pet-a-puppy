class PuppiesController < ApplicationController
  before_action :set_puppy, only: [:show, :edit, :update, :destroy]

  def index
    @puppies = policy_scope(Puppy)
    @markers = @puppies.geocoded.map do |puppy|
      {
        lat: puppy.latitude,
        lng: puppy.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { puppy: puppy })
      }
    end
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
    @puppy.user = current_user
    authorize @puppy
    if @puppy.save!
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
    else
      render :edit
    end
  end

  def destroy
    @puppy.destroy
    redirect_to root_path
  end

  private

  def set_puppy
    @puppy = Puppy.find(params[:id])
  end

  def puppy_params
    params.require(:puppy).permit(:name, :description, :price, :photo, :address)
  end
end
