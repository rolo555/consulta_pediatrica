module SurgeryQuotationsHelper
  def surgery_quotation_total_expenses_column(record)
     number_to_currency(record.total_expenses, :precision => 0)
  end

  def surgery_quotation_days_of_hospitalization_column(record)
    time_ago_in_words(record.days_of_hospitalization.days.from_now)
  end

  def surgery_quotation_surgery_time_column(record)
    time_ago_in_words(record.surgery_time.to_i.minutes.from_now)
  end

  def surgery_quotation_days_of_hospitalization_show_column(record)
    record.days_of_hospitalization
  end

  def surgery_quotation_surgery_time_show_column(record)
    record.surgery_time
  end

  def surgery_quotation_hospital_expenses_show_column(record)
    list = record.hospital_expenses.map { |item| content_tag "li", item.to_label }
    content_tag "ul", list.join(" ")
  end
end
