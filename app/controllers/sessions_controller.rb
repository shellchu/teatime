class SessionsController < ApplicationController
  def new
    redirect_to home_path if current_user
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to home_path, flash: {success: "You are signed in, enjoy!"}
    else
      flash[:danger] = "Invaild email or password."
      render :new
    end
  end
end
