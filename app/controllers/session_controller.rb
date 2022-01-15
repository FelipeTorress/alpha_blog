class SessionController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:notice] = "Logado com sucesso!" 
      redirect_to user_path(user)
    else
      flash.now[:alert] = "Credenciais incorretas! tente novamente"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "Você deslogou"
    redirect_to root_path
  end
end