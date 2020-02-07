class BooksController < ApplicationController
  
  def index
    @books = Book.all
    @book = Book.new
  end

  def show
  	@book = Book.find(params[:id])
  end

  def create
    @books = Book.all
    @book = Book.new(book_params)
      if @book.save
        flash[:notice] = "successfully"
        redirect_to book_path(@book)
      else
        flash.now[:error] = @book.errors.full_messages
        render :index
      end
  end

  def edit
  	@book = Book.find(params[:id])
  end

  def update
  	book = Book.find(params[:id])
  	book.update(book_params)
  	flash[:notice] = "successfully"
  	redirect_to book_path(book)
  end

  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	flash[:notice] = "successfully"
  	redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
