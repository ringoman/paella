class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string  :name
      t.text    :text
      t.timestamps
    end
  end
end
