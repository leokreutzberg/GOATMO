class GoatsController < ApplicationController

  def index
    @goats = Goat.all
  end

  def show
    @goat = Goat.find(params[:id])
  end

  def new
    @goat = Goat.new
  end

  def destroy
    @goat = Goat.find(params[:id])
    @goat.destroy
  end

  def create
    @goat = Goat.new(goats_params)
    @goat.save
  end

  def edit
    @goat = Goat.find(params[:id])
  end

  def update
    @goat = Goat.find(params[:id])
    @goat.update(goats_params)
  end

  private

  def goat_params
    params.require(:goats).permit(:name, :photo)
  end
end
