class UsersController < ApplicationController
  def dashboard
    @user = current_user
    @bookings = @user.bookings
  end
end
