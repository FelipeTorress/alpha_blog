class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create 
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Bem vindo ao Alpha_Blog #{@user.username}!"
      redirect_to articles_path
    else
      render 'new'
    end
  end

  private

  def user_params
    return params.require(:user).permit(:username, :email, :password)
  end

end