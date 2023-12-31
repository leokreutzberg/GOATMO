class GoatsController < ApplicationController
  def index
    @goats = Goat.all.order(created_at: :desc)
    @markers = @goats.geocoded.map do |goat|
      {
        lat: goat.latitude,
        lng: goat.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {goat: goat}),
        marker_html: render_to_string(partial: "marker")
      }
    end

    if params[:query].present?
      @goat_search = Goat.search(params[:query])
      @goats = @goat_search.order(created_at: :desc)
    else
      @goats = Goat.all.order(created_at: :desc)
    end
  end

  def show
    @goat = Goat.find(params[:id])

    @markers =
      [{
        lat: @goat.latitude,
        lng: @goat.longitude,
        marker_html: render_to_string(partial: "marker")
      }]

    @booking = Booking.new

  end

  def new
    @goat = Goat.new
  end

  def destroy
    @goat = Goat.find(params[:id])
    @goat.destroy
  end

  def create
    @goat = Goat.new(goat_params)
    @goat.user = current_user
    @goat.save
    redirect_to goat_path(@goat), notice: "Goat added successfully"
  end

  def edit
    @goat = Goat.find(params[:id])
  end

  def update
    @goat = Goat.find(params[:id])
    @goat.update(goat_params)
  end

  private

  def goat_params
    params.require(:goat).permit(:name, :photo, :price, :description, :location)
  end

end
