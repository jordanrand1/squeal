class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.create(user_params)
    redirect_to restaurants_path
  end

  def destroy
    Restaurant.find(params[:id]).destroy
    redirect_to restaurants_path
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update(user_params)
      redirect_to restaurant_path
    else
      render :edit
    end
  end

  private

    def user_params
      params.require(:restaurant).permit(:image, :name, :rating, :description)
    end
end
