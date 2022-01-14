class UsersController < ApplicationController

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
      @user = User.find(params[:id])
      @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.create(user_params)
    if @user.save
      flash[:notice] = "Bem vindo ao Alpha_Blog #{@user.username}!"
      redirect_to user_path(@user)
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
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  private

  def user_params
    return params.require(:user).permit(:username, :email, :password)
  end

end