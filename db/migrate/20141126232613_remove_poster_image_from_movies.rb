class RemovePosterImageFromMovies < ActiveRecord::Migration
  def change
    remove_column :movies, :poster_image
  end
end
