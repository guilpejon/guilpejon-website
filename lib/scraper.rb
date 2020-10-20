class Scraper
  def fetch_video(url)
    regex = /^.*(youtu\.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*/
    video_id = url.scan(regex).flatten.last

    video = Yt::Video.new id: video_id

    if Video.find_by(youtube_id: video.id).present?
      puts "Video already scraped"
      return
    end

    v = Video.new(
      title: video.title,
      description: video.description,
      youtube_id: video.id,
      published_at: video.published_at
    )

    attach_cover(v)
    v.save!
  end

  private

  def attach_cover(video)
    downloaded_image = open("https://img.youtube.com/vi/#{video.youtube_id}/sddefault.jpg")
    video.thumbnail.attach(io: downloaded_image, filename: "#{video.youtube_id}.jpg")
  end
end
