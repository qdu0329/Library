class BooksController < ApplicationController
  def new
    @book = Book.new
  end

  # def index
  #   @books = Book.all
  # end

  def create
    @book = Book.new(params.require(:book).permit(:title, :author, :isbn, :copies))
    if @book.save
      redirect_to welcome_index_path
    else
      render 'new'
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(params.require(:book).permit(:title, :author, :isbn, :copies))
      redirect_to new_admin_search_path
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end

  def index
    if params[:search]
      empty_search = params[:search].keep_if {|k, val| !val.blank?}.empty?
    else
      empty_search = true
    end
    if empty_search
     # no search was submitted, or search params are all blank
     @books = ""
    else
     # a search was submitted
     @books = Book.search(params[:search])
    end
  end

  # def search
  #   @books = Book.where("title LIKE ?", "%#{params[:search]}%")
  # end

  def checkout
    @book = Book.find(params[:id])
    if @book.copies > 0
      @book.checkout
      @book.save!
      redirect_to new_admin_search_path
    else
      flash.alert = 'The book has less than 1 copy left.'
    end
  end

end
