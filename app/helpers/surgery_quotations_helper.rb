module SurgeryQuotationsHelper
  def surgery_quotation_total_expenses_column(record)
    record.medical_expenses + record.hospital_expenses.map { |e| e.price }.sum
  end
end
