module ImagesHelper
  def image_image_column(record)
    lightbox_image_tag record.image.url(:thumbnail), record.image.url
  end
end
