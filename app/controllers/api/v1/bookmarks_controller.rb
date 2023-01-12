class Api::V1::BookmarksController < Api::V1::BaseController
  def create
    entry = Entry.find(params[:entry_id])
    current_user.bookmark(entry)
    head :ok
  end

  def destroy
    entry = current_user.bookmarked_entries.find(params[:id])
    current_user.unbookmark(entry)
    head :ok
  end
end
