class ArticlesController < ApplicationController

  def create
    @article = Article.create(article_params)
    if @article.valid?
      render json: {article: @article}
    else
      render json: {error: @article.errors.messages}
    end
  end

  private

  def article_params
    params[:article].permit(:title, :subtitle, :body, :topic)
  end

end
