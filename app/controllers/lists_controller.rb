class ListsController < ApplicationController
  before_action :set_list, only: [:show]

  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @bookmark = Bookmark.new
    @bookmarks = @list.bookmarks

  end

  def new
    @list = List.new
  end

  def create
    @list = List.create!(list_params)
    raise
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :photo)
  end
end
