class BooksController < ApplicationController
  

  def index
    @book = Book.new
    @books = Book.all
    @user = @book.user
    # @user = User.find(params[:id])
    # @users = User.all
   
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice:'You have creatad book successfully.'
    else
      @books = Book.all
      @user = @book.user
    render :index
    end
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    
  end

  def edit
    @book = Book.find(params[:id])
    @book.user_id = current_user.id
  end

  def update
    @book = Book.find(params[:id])
    if @book.user_id = current_user.id
    if @book.update(book_params)
    redirect_to book_path(@book), notice:'Book was successfully updated.'
    else
      render :edit
    end
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path, notice:'Book was successfully destroyed.'
  end

  private
  
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
   
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
