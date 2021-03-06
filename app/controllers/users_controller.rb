class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
    @password_confirmation = "Confirmation";
  end

  def create
   @user = User.new(user_params)
	   if(@user.save)
        #automatically log a user in
        log_in @user
        flash[:success] = "Welcome to the bookshelf dashboard"
	   	  redirect_to @user
	   else
	   	render 'new'
	   end
  end

  private

	  def user_params
	     params.require(:user).permit(:name, :email, :password, :password_confirmation)
	  end
end
