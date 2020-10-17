class StaticPagesController < ApplicationController
  def home
    @images = Image.all
    @articles = Article.all.sample(3)
  end
end
