class BookingsController < ApplicationController
before_action :set_booking, only: [:show, :edit, :update]

  def new
    set_flat
    @booking = Booking.new
  end

  def create
    set_flat
    start_date = params[:booking][:start_date].to_date
    end_date = params[:booking][:end_date].to_date
    @booking = Booking.new(booking_params)
    if @flat.available?(start_date, end_date)
      @booking.flat = @flat
      @booking.user = current_user
      if @booking.save
        redirect_to flat_booking_path(@booking.flat, @booking)
      else
        render :new
      end
    else
      flash[:alert] = "This flat is not available on the requested period"
      render :new
    end
  end

  def show
  end

  def edit
    set_flat
  end

  def update
    @booking.accepted  = booking_params[:accepted]
    if @booking.save
      redirect_to flat_booking_path(@booking.flat, @booking)
    else
      render :edit
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :flat_id, :user_id, :accepted)
  end

  def set_flat
    @flat = Flat.find(params[:flat_id])
  end

end
