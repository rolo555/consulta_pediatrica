module ConsultationsHelper
  def consultation_existing_laboratories_form_column(record, options)
    link_to_record_select 'Pick a existing laboratories', 'laboratory_profiles', :onselect => ""
  end

  def consultation_existing_diagnoses_form_column(record, options)
    link_to_record_select 'Pick a existing diagnoses', 'diagnostics', :onselect => ""
  end

  def consultation_existing_medical_certificates_form_column(record, options)
    link_to_record_select 'Pick a existing medical certificates', 'medical_certificates', :onselect => ""
  end
end
