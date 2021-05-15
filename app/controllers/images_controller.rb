class ImagesController < ApplicationController
  def index
    @images = Image.order("created_at DESC")
  end
end
