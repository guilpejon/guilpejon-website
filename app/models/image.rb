class Image < ApplicationRecord
  enum orientation: { landscape: 0, portrait: 1 }
  has_one_attached :file

  after_save :set_filename

  def set_filename
    file.blob.update(filename: "#{name.downcase}.#{file.filename.extension}") if file.attached?
  end
end
