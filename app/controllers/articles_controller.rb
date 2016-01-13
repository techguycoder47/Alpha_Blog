class ArticlesController < ApplicationController
  def show
    @article = Article.find(params[:id])
  end

  def edit
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      flash[:notice] = "Your article has been saved."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def index
    @articles = Article.all
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    flash[:notice] = "Article has been deleted."
    redirect_to articles_path
  end

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Your article has been updated."
      redirect_to @article
    else
      render 'edit'
    end
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
end
