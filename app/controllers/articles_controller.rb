class ArticlesController < ApplicationController
  before_action :authorized, only: [:create]

  def index
    @articles = Article.all
    render json: {articles: @articles}
  end
  
  def create
    @article = Article.create(article_params)
    if @article.valid?
      render json: {article: @article}
    else
      render json: {error: @article.errors.messages}
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(article_params)
    if @article.valid?
      @article.reload
      render json: {article: @article}
    else
      render json: {error: @article.errors.messages}
    end
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Article does not exist"}
  end

  def destroy
    @article = Article.find(params[:id]).delete
    render json: {success: "#{@article.title} has been deleted successfuly"}
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Article does not exist"}
  end

  def anxiety_articles
    @articles = Article.where(topic: 0)
    render json: {articles: @articles}
  end

  def depression_articles
    @articles = Article.where(topic: 1)
    render json: {articles: @articles}
  end

  def lifestyle_articles
    @articles = Article.where(topic: 2)
    render json: {articles: @articles}
  end

  def pyschological_analysis_articles
    @articles = Article.where(topic: 3)
    render json: {articles: @articles}
  end

  private

  def article_params
    params.permit(:title, :subtitle, :body, :topic, :article_image)
          .merge(created_by: logged_in_user.try(:username))
  end

end
