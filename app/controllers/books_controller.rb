class BooksController < ApplicationController
 before_action :authenticate_user!
 before_action :user_authenticate, only: [:edit]
  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
    @new_book =Book.new
  end

  def new

  end
  def create

      @book = Book.new(book_params)
      @book.user_id = current_user.id

      if @book.save
         flash[:notice] = "You have creatad book successfully."
         redirect_to book_path(@book.id)
      else
         @books = Book.all
         @user = User.find(current_user.id)
         render action: :index
      end
  end
  def edit
      @book = Book.find(params[:id])
      @user = User.find(current_user.id)
  end
  def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
         flash[:notice] = "Book was successfully updateed."
         redirect_to book_path(@book.id)
      else
         render action: :edit
      end
  end
  def destroy
      book = Book.find(params[:id])
      if book.destroy
         flash[:notice] = "Book was successfully destroyed."
         redirect_to books_path
      else
         render action: :new
      end

  end
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
  def user_authenticate
     @book = Book.find(params[:id])
     unless current_user.id == @book.user_id
            redirect_to books_path
     end

  end
end
