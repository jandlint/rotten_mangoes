class AlterColumnInMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :poster_image_url
    add_column :movies, :poster_image, :string
  end
end
