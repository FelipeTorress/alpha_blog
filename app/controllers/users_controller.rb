class UsersController < ApplicationController

  before_action :search_user, only: [:show, :edit, :update]

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create 
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Bem vindo ao Alpha_Blog #{@user.username}!"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
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

  def search_user
    return @user = User.find(params[:id])
  end

end