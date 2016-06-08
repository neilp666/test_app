class CreateCandies < ActiveRecord::Migration
  def change
    create_table :candies do |t|
      t.string :title
      t.string :discription

      t.timestamps null: false
    end
  end
end
