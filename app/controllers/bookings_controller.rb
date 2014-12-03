class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :answer]


  def new
    set_flat
    @booking = Booking.new
  end


  def create
    @booking = Booking.new(booking_params)
    @booking.flat = set_flat
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def show
  end

  def answer
  end


  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id, :user_id)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

end
