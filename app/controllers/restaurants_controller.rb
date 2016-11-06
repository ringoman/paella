class RestaurantsController < ApplicationController
  def index
    @a=Restaurant.page(params[:page]).per(6)
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reviews = @restaurant.reviews.includes(:user)
  end
end
