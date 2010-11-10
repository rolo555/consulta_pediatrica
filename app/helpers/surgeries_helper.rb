module SurgeriesHelper
  def surgery_images_column(record)
    unless record.images.empty?
      record.images.collect { |i|
        image_tag i.image.url(:thumbnail)
      }
    else
      "-"
    end
  end
end
