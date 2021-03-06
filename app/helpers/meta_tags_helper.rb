module MetaTagsHelper
  def meta_title
    content_for?(:meta_title) ? "#{DEFAULT_META[:meta_title]} - #{content_for(:meta_title)}" : DEFAULT_META[:meta_title]
  end

  def meta_description
    content_for?(:meta_description) ? content_for(:meta_description) : DEFAULT_META[:meta_description]
  end

  def meta_type
    content_for?(:meta_type) ? content_for(:meta_type) : DEFAULT_META[:meta_type]
  end

  def meta_image
    meta_image = (content_for?(:meta_image) ? content_for(:meta_image) : DEFAULT_META[:meta_image])
    meta_image.starts_with?('http') ? meta_image : image_url(meta_image)
  end

  def meta_author
    content_for(:meta_author)
  end

  def meta_robots
    content_for(:robots) ? content_for(:robots) : DEFAULT_META[:meta_robots]
  end
end
