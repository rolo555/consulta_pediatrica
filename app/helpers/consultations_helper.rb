module ConsultationsHelper
  def consultation_existing_laboratories_form_column(record, options)
    link_to_record_select 'Pick a existing laboratories', 'laboratory_profiles', :onselect => "getElementsByAttribute(document, 'textarea', 'name', 'laboratory')[0].value = document.getElementById('asd').value;"
  end
end
