class AddRestaurantidToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :restaurant_id, :int
  end
end
