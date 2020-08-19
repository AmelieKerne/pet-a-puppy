class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @puppy = Puppy.find(params[:puppy_id])
    @booking = Booking.new
    @puppies = Puppy.all
    authorize @booking
  end

  def create
    @puppy = Puppy.find(params[:puppy_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.accepted = false
    authorize @booking
    @booking.puppy = @puppy
    if @booking.save!
      redirect_to puppy_path(@puppy)
    else
      render :new
    end
  end

  # def update
  #   @booking = Booking.find(params[:id])
  #   @booking.accepted = true
  #   authorize @booking
  # end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :puppy_id)
  end

end
