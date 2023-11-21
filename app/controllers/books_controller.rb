class BooksController < ApplicationController
  before_action :set_book, only: %i[ show ]

  def index
    @books = Book.all
  end

  def show
  end

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user = current_user
    if @book.save
      redirect_to books_path, notice: "Book was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def create
  #   @restaurant = Restaurant.new(restaurant_params)
  #   if @restaurant.save
  #     redirect_to restaurant_path(@restaurant)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end
  # end

  private

  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(:title, :author, :description, :price)
  end
end
