class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @bookings = @user.bookings
    @listings = @user.goats
  end
end
