class Video < ApplicationRecord
  extend FriendlyId

  has_one_attached :thumbnail
  validates :youtube_id, uniqueness: true

  default_scope{order("published_at DESC")}

  friendly_id :title, use: [:slugged]

  enum kind: { music: 0, tech: 1 }

  def url
    "https://www.youtube.com/watch?v=#{youtube_id}"
  end
end
