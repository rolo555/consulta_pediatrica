module ApplicationRecordsHelper
  def options_for_association_conditions(association)
    if association.name == :vaccine
      { 'vaccines.vaccines_name_id' => @record.immunization_record.vaccines_name_id }
    else
      super
    end
  end

  def application_record_doctor_application_form_column(record, options)
    js = "var vaccines = this.up('.form-element').next(); if(this.checked) vaccines.show(); else vaccines.hide();"
    options[:onchange] = js
    column = active_scaffold_config.columns[:doctor_application]
    active_scaffold_input_checkbox column, options
  end

  #  def application_record_vaccine_form_column(record, html_options)
  #    if record.doctor_application
  #      debugger
  #      column = active_scaffold_config.columns[:vaccine]
  #      options = { :selected => @record.send(column.name).to_s }
  #      options_for_select = active_scaffold_translated_options(column)
  #      html_options.update(column.options[:html_options] || {})
  #      options.update(column.options)
  #      select(:record, column.name, options_for_select, options, html_options)
  #    else
  #      content_tag "span", "", html_options
  #    end
  #  end
end
