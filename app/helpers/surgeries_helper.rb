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

  def surgery_doctors_amount_column(record)
    record.calculate_doctors_amount
  end
end
