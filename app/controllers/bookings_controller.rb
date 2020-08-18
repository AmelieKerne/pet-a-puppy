class BookingsController < ApplicationController
  def new
    @puppy = Puppy.find(params[:puppy_id])
    @booking = Booking.new
    @puppies = Puppy.all
    authorize @booking
  end

  def create
    @puppy = Puppy.find(params[:puppy_id])
    @booking = Booking.new(booking_params)
    authorize @booking
    @booking.puppy = @puppy
    if @booking.save
      redirect_to puppy_path(@puppy)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :puppy_id)
  end

end
