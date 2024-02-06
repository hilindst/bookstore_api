class BooksController < ApplicationController
  def index
    @books = Book.all
  end
  
  def show
    @book = Book.find(params[:id])
  end
  
  def create
    @book = Book.new(params[:book])
    if @book.save
        redirect_to action:: 'show', id: @book.id
    else
      render json: { error: "Unable to create book." }
    end
  end
   
  def update
    @book = Book.find(params[:id])
   
    if @book.update_attributes(book)
       redirect_to :action => 'show', :id => @book
    else
    end
    
 end
 
 def book_param
    params.require(:book).permit(:title, :author_id)
 end
  
  def destroy
    Book.find(params[:id]).destroy
    redirect_to :action => 'index'
  end
end