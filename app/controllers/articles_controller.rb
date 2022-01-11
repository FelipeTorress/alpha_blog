class ArticlesController < ApplicationController

  before_action :search_article, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @articles = Article.all
  end

  def new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)
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
end