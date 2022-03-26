class ReviewsController < ApplicationController
  before_action :find_restaurant
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.restaurant = @restaurant
    if @review.save
    redirect_to restaurant_path(@restaurant)
    else
      render :new
    end

    def destroy
      @review = Review.find(params[:id])
      redirect_to restaurant_path(@review.restaurant)
    end
  end
  private

  def find_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

  def review_params
    params.require(:review).permit(:content)
  end
end
