class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    render :show
  end

  def new
    @restaurant = Restaurant.new
    render :new
  end

  def create
    @restaurant = Restaurant.create(user_params)
    render :index
  end

  private

    def user_params
      params.require(:restaurant).permit(:image, :name, :rating, :description)
    end
end
