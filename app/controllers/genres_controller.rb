class GenresController < ApplicationController

  def create
  	genre_params = params.require(:genre).permit(:name)
  	@genre = Genre.create(genre_params)
  	redirect_to genres_path
  end

  def index
  	@genres = Genre.all
    @genre = Genre.new
  end

  def show
  	@genre = Genre.friendly.find(params[:id])
  end

  def update
  	genre_params = params.require(:genre).permit(:name)
  	@genre = Genre.friendly.find(params[:id])
  	@genre.update_attributes(genre_params)
  	redirect_to @genre
  end

  def destroy
  	@genre = Genre.friendly.find(params[:id])
  	@genre.destroy
  	redirect_to "/genres"
  end

end