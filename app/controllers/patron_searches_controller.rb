class PatronSearchesController < ApplicationController
  def new
    @patron_search = PatronSearch.new
  end

  def create
    @patron_search = PatronSearch.create(search_params)
    redirect_to @patron_search
  end

  def show
    @patron_search = PatronSearch.find(params[:id])
  end

  private
  def search_params
    params.require(:patron_search).permit(:title, :author, :isbn)
  end
end
