module SurgeryQuotationsHelper
  def surgery_quotation_total_expenses_column(record)
    record.total_expenses
  end

  def surgery_quotation_hospital_expenses_show_column(record)
    list = record.hospital_expenses.map { |item| content_tag "li", item.to_label }
    content_tag "ul", list
  end
end
