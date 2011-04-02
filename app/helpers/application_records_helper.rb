module ApplicationRecordsHelper

  def options_for_association_conditions(association)
    if association.name == :vaccine and @record.immunization_record.present?
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

end
