class UsersController < ApplicationController

   def home
   end

   def index
     @users = User.all
    
   end
   
   def create
    book = Book.new(book_params)
    if book.save
    redirect_to book_path(book.id), notice:'You have creatad book successfully.'
    else
      @book = book
      @books = Book.all
    render :show
    end
   end
   
   
   def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.all
   end

   def edit
    @user = User.find(params[:id])
   end

   def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
   end

   private
   def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
   end
  
   def book_params
    params.require(:book).permit(:title, :body)
   end
  

end


