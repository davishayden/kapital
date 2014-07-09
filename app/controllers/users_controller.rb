class UsersController < ApplicationController
	
	
	def new
 	 @user = User.new
 	#@user = User.new(user_params)
 
	end
	
	

	def create
		params.permit!
	  @user = User.new(params[:user])
	  #@user = User.new(user_params)
 	 if @user.save
  	  redirect_to root_url, :notice => "Signed up!"
 	 else
   		render "new"
 	 end
	end
	
	def user_params
		params.require(:user).permit(:username, :email, :password, :salt, :encrypted_password)
 		#params.permit(:user, :username, :email, :password, :salt, :encrypted_password)
 	end
end