module ApplicationRecordsHelper
  def application_record_vaccine_form_column(record, options)
    options[:id].gsub!("record_vaccine_", "record_vaccine_id_")
    content_tag "div", "", options
  end

  def get_scope_to_s()
    scope = params["scope"]
    scope.gsub!('[', '["')
    scope.gsub!(']', '"]')
    scope
  end

  def application_record_vaccine_id_form_column(record, options)
    options[:id].gsub!("record_vaccine_", "record_vaccine_id_") if options[:id]["record_vaccine_id_"].nil?
    scope = get_scope_to_s
    v = eval("params['record']#{scope}['doctor_application']")
    if v == 'true'
      collection_select(:record, :vaccine_id, Vaccine.all(:conditions => {:vaccines_name_id => params[:record][:vaccines_name]}), :id, :to_label, {}, options)
    else
      content_tag "div", "", options
    end
  end

end
