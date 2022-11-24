class BookmarksController < ApplicationController
  def create
    @list = List.find(params[:list_id])
    @movie = Movie.find(bookmark_params[:movie_id])
    @comment = bookmark_params[:comment]
    @bookmark = Bookmark.new(list: @list, movie: @movie, comment: @comment)
    if @bookmark.save
      redirect_to @list
    else
      render 'lists/show', status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list)
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id, :list_id)
  end
end
