class ReviewsController < ApplicationController
  def new
    @review = Review.new
    @restaurant_id = Restaurant.find(params[:id])
  end

  def create
    @review = Review.create(user_params)
    redirect_to restaurant_path(@review.restaurant_id)
  end

  def destroy
    Review.find(params[:id]).destroy
  end

  private

    def user_params
      params.require(:review).permit(:author, :rating, :body, :restaurant_id)
    end
end
