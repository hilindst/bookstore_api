class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]

  def create
    book = Book.new(book_params)
    if book.save
      render json: book, status: :created
    else
      render json: book.errors, status: :unprocessable_entity
    end
  end

  def index 
    render json: Book.all
  end

  def show 
    render json: @book, status: :ok 
  end

  def update 
    if @book.update(book_params)
      render json: @book, status: :ok 
    else 
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @book.destroy
      # return a response with only headers and no body
      head :no_content
    else 
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :author_id)
  end

  def set_book
    @book = Book.find(params[:id])
  end
end