class StaticPagesController < ApplicationController
  def home
    @images = Image.all
    @articles = Article.where("published_at < ?", Time.zone.now).order(published_at: :desc).limit(3)
  end
end
