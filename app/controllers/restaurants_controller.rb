class RestaurantsController < ApplicationController
  def index
    @a=Restaurant.all
  end
end
