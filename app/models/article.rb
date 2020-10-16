class Article < ApplicationRecord
  has_one_attached :thumbnail
  has_rich_text :content
  before_save :set_slug

  def set_slug
    parameterized_slug = title.parameterize
    self.slug = if Article.where.not(id: id).pluck(:slug).include?(parameterized_slug)
                  "#{parameterized_slug}-#{rand(100)}"
                else
                  parameterized_slug
                end
  end
end
