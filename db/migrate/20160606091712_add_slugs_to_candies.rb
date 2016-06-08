class AddSlugsToCandies < ActiveRecord::Migration
  def change
    add_column :candies, :slug, :string
    add_index :candies, :slug, unique: true
  end
end
