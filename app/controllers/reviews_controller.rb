class ReviewsController < ApplicationController
  before_action :set_booking, only: %i[new create]

  def new
    @booking = Booking.find(params[:booking_id])
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.booking = @booking
    @review.user_id = current_user.id

    if @review.save
      redirect_to goat_path(@booking.goat)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to dashboard_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:booking_id])
  end

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
