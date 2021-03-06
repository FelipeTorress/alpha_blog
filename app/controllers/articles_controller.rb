class ArticlesController < ApplicationController

  before_action :search_article, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:show, :index]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.create(article_params)
    @article.user = current_user
    p @article
    if @article.save
      flash[:notice] = "Artigo criado com sucesso!"
      redirect_to article_path(@article)
    else
      render "new"
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Artigo editado com sucesso!"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private

  def search_article
    return @article = Article.find(params[:id])
  end

  def article_params
    return params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user && !current_user.admin?
      flash[:alert] = "Você so pode deletar e alterar seus artigos1"
      redirect_to article_path(@article)
    end
  end
end