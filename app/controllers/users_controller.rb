class UsersController < ApplicationController
 before_action :correct_user, only: [:edit]
 
  

   def home
   end

   def index
     @users = User.all
     @book = Book.new
     @books = Book.all
     @user = current_user
   end
   
   def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
    redirect_to book_path(@book.id), notice:'You have creatad book successfully.'
    else
      @books = Book.all
    render :show
    end
   end
   
   
   def show
    @user = User.find(params[:id])
    # @users = User.all
    @book = Book.new
    @books = @user.books
   end

   def edit
    @user = User.find(params[:id])
   end

   def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice:'successfully updated.'
    else
    render :edit
    end
   end

   private
   def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
   end
  
   def book_params
    params.require(:book).permit(:title, :body, :user_id)
   end
   
   def correct_user
    user = User.find(params[:id])
    if user != current_user
     redirect_to user_path(current_user)
    end
   end

end


