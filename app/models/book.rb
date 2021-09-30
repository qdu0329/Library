class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates	:title,	presence:	true
  validates :author, presence: true
  validates :copies, presence: true, numericality: { only_integer: true }
  validates :isbn, presence: true, numericality: { only_integer: true }
  validates_format_of :isbn, :with => /[0-9]{10}/
  validates_length_of :isbn, maximum: 10
  validates_uniqueness_of :isbn

  def self.adminsearch(title,author,isbn)
    if adminsearch
      where("isbn LIKE ? and title LIKE ? and author LIKE ? ", "%#{isbn}%", "%#{title}%", "%#{author}%")
      # where("isbn LIKE ? and title LIKE ? and author LIKE ? ", "#{isbn}", "#{title}", "#{author}")
    end
  end

  def checkout
    self.copies-=1
    #redirect_to new_admin_search_path
  end
end
