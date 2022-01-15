class ApplicationController < ActionController::Base
  #fazendo isso as funções estarão disponives para as views e para os controllers
  helper_method :current_user, :logged_in?

  def current_user
    return @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    return !!current_user
  end

  def require_user
    if ! logged_in?
      flash[:notece] = "Você tem que estar logado para fazer isso"
      redirect_to login_path 
    end
  end
end
