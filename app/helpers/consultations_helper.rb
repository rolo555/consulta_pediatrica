module ConsultationsHelper
  def consultation_laboratory_form_column(record, options)
    text_area_and_link_to_record_select record, :laboratory, options, :laboratory_profiles
  end

  def consultation_diagnosis_form_column(record, options)
    text_area_and_link_to_record_select record, :diagnoses, options, :diagnostics
  end

  def consultation_medical_certificate_form_column(record, options)
    text_area_and_link_to_record_select record, :medical_certificate, options, :medical_certificates
  end

  def consultation_order_form_column(record, options)
    text_area_and_link_to_record_select record, :order, options, :medical_orders
  end
end
