class SessionsController < ApplicationController
  def new
  end


  def create
  	email = params[:session][:email].downcase
  	password = params[:session][:password]
  	user = User.find_by(email: email)

  	if(user && user.authenticate(password))
  		#log the user in
  		log_in user
  		params[:session][:remember_me] == '1' ? remember(user) : forget(user)
  		redirect_to user
  	else
  	  #Create an error message
  	  flash.now[:danger] = "Invalid email/password combination"
  	  render 'new'
  	end
  end

  def destroy
     log_out if logged_in?
     redirect_to root_url
  end

  private
    def session_params
    	params.require(:session).permit(:email, :password)
    end
end
