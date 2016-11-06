class ReviewsController < ApplicationController

  def index
    @a=Review.all
  end

  def create
    @review = Review.create(text: cp[:text],restaurant_id: cp[:restaurant_id])
    redirect_to "/restaurants/#{@review.restaurant.id}"
  end

  private
  def cp
    params.permit(:text,:restaurant_id)
  end
end
