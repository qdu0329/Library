class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end
  def index
    @review = Review.all
  end
  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(params.require(:review).permit(:name, :body))
    redirect_to book_path(@book)
  end
end
