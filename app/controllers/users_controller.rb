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

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "Sua conta foi atualizada com sucesso!"
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    return params.require(:user).permit(:username, :email, :password)
  end

end