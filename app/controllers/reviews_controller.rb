class ReviewsController < ApplicationController

  def index
    @a=Review.all
  end

  def create
    @review = Review.create(text: cp[:text],restaurant_id: cp[:restaurant_id],user_id: current_user.id)
    redirect_to "/restaurants/#{@review.restaurant.id}"
  end

  def destroy
    review = Review.find(params[:id])
    go = review.restaurant.id
    if review.user_id == current_user.id
      review.destroy
    end
    redirect_to "/restaurants/#{go}"
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    review = Review.find(params[:id])
    go = review.restaurant.id
    if review.user_id == current_user.id
          review.update(text: params[:text])
    end
    redirect_to "/restaurants/#{go}"

  end

  private
  def cp
    params.permit(:text,:restaurant_id)
  end
end
