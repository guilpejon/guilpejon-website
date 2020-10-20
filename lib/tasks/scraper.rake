require 'scraper'

namespace :scraper do
  task :initialize do
    @scraper = Scraper.new
  end

  desc "Fetch video"
  task :fetch_video, [:url] => [:environment, :initialize] do |t, args|
    @scraper.fetch_video(args[:url])
  end
end
