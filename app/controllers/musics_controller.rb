# yeap, I know musics does not exist
class MusicsController < ApplicationController
  def index
    @videos = Video.all
  end
end
