class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
    redirect_to new_restaurant_path
  end

  def create
    @restaurant = Restaurant.create(user_params)
    redirect_to restaurants_path
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    redirect_to restaurants_path
  end

  private

    def user_params
      params.require(:restaurant).permit(:image, :name, :rating, :description)
    end
end
