class PatronSearch < ApplicationRecord
  def patronsearch_books
    books = Book.all
    books = books.where("isbn LIKE ? and title LIKE ? and author LIKE ? ", "%#{isbn}%", "%#{title}%", "%#{author}%")
    # books = books.where("isbn LIKE ? and title LIKE ? and author LIKE ? ", "#{isbn}", "#{title}", "#{author}")
    return books
  end
end
