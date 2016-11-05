class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.text :tel
      t.text :image
      t.timestamps
    end
  end
end
