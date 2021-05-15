class StaticPagesController < ApplicationController
  def home
    @images = Image.order("created_at DESC").limit(6)
    @articles = Article.where("published_at < ?", Time.zone.now).order(published_at: :desc).limit(3)
    @projects = Project.all
    @videos = Video.limit(6)
  end

  def contact; end
end
