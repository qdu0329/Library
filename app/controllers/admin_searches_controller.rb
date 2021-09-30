class AdminSearchesController < ApplicationController
  def new
    @admin_search = AdminSearch.new
  end

  def create
    @admin_search = AdminSearch.create(search_params)
    redirect_to @admin_search
  end

  def show
    @admin_search = AdminSearch.find(params[:id])
  end

  private
  def search_params
    params.require(:admin_search).permit(:title, :author, :isbn)
  end
end
