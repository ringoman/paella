class ReviewsController < ApplicationController

  def index
    @a=Review.all
  end

end
