class BookingsController < ApplicationController
  before_action :set_booking, only: [:destroy]

  def new
    @goat = Goat.find(params[:goat_id])
    @booking = Booking.new
  end

  def create
    @goat = Goat.find(params[:goat_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.goat = @goat

    if @booking.save
      redirect_to dashboard_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_path, notice: 'Booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
