class BooksController < ApplicationController

  protect_from_forgery except: :create


  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def create
     book = Book.new(book_params)

    if book.save
    redirect_to book_path(book.id), notice:'You have creatad book successfully.'
    else
      @book = book
      @books = Book.all
    render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
    redirect_to book_path(@book), notice:'Book was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path, notice:'Book was successfully destroyed.'
    else
      render :index
    end
  end



  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
