class UsersController < ApplicationController

  def home
    @name = current_user ? current_user.name : "Ironhacker"
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.valid?
      @user.save
      redirect_to user_path(@user), notice: "User #{@user.name} added correctly"
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
