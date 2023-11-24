class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @bookings = @user.bookings.order(created_at: :desc)
    @listings = @user.goats.order(created_at: :desc)
  end
end
