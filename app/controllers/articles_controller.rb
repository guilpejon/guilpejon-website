class ArticlesController < ApplicationController
  def index
    @articles = Article.where("published_at < ?", Time.zone.now).order(published_at: :desc)
  end

  def show
    @article = Article.find_by(slug: params[:id])
  end
end
