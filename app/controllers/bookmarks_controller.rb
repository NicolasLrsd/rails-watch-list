class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
    @list = List.find(params[:list_id])
  end

  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(params[:bookmark][:movie_id])
    @bookmark = Bookmark.new(bookmarks_params)
    @bookmark.movie = @movie
    @bookmark.list = @list
    @bookmark.save!
    redirect_to list_path(@list)
  end

  private

  def bookmarks_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end


end
