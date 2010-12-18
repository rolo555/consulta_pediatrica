module VaccineSchedulesHelper
  def vaccine_schedule_number_form_column(record, options)
    unless record.new_record?
      options[:style] = "line-height: 32px;"
      content_tag 'span', record.number, options
    end
  end

  def vaccine_schedule_application_type_show_column(record)
    content_tag "tag", "#{record.number} #{record.application_type}"
  end
end
