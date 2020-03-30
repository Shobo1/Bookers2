class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :user_authenticate, only: [:edit]
  def show
  	@user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user_id: params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated successfully"
      redirect_to user_path(@user.id)
    else
      flash[:notice] = ""
      render :edit
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @users = User.all
  end
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  def user_authenticate
     @user = User.find(params[:id])
     unless current_user.id == @user.id
            redirect_to user_path(current_user)
     end
  end
end
