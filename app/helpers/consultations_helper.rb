module ConsultationsHelper
  def consultation_laboratory_form_column(record, options)
    text_area_and_link_to_record_select :laboratory, options, :laboratory_profiles
  end

  def consultation_diagnosis_form_column(record, options)
    text_area_and_link_to_record_select :diagnosis, options, :diagnostics
  end

  def consultation_medical_certificate_form_column(record, options)
    text_area_and_link_to_record_select :medical_certificate, options, :medical_certificates
  end

  def consultation_order_form_column(record, options)
    text_area_and_link_to_record_select :order, options, :medical_orders
  end

  def consultation_images_column(record)
    unless record.images.empty?
      record.images.collect { |i|
        image_tag i.image.url(:thumbnail)
      }
    else
      "-"
    end
  end
end
