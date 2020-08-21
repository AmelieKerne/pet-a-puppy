class BookingsController < ApplicationController
  def index
    @bookings = policy_scope(Booking)
    # @bookings = booking.puppy.user
    @owner_puppies = Puppy.where(user_id: current_user.id)
    # @owner_bookings = @owner_puppy.bookings
    @current_user_bookings = Booking.where(user_id: current_user.id)
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
    authorize @booking
    @booking.puppy = @puppy
    if @booking.save!
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def accept

    @booking = Booking.find(params[:id])
    @booking.accepted = true
    @booking.save
    redirect_to bookings_path
    authorize @booking
  end

  def reject
    @booking = Booking.find(params[:id])
    @booking.accepted = false
    @booking.save
    redirect_to bookings_path
    authorize @booking
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :puppy_id)
  end

end
