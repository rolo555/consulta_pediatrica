module ConsultationsHelper
  def consultation_existing_laboratories_form_column(record, options)
    link_to_record_select 'Pick a existing laboratories', 'laboratory_profiles', :onselect => ""
  end
end
