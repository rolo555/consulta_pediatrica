module HospitalizationsHelper
  def hospitalization_doctors_names_column(record)
    record.doctors_name.map {|d| d.to_label}.join(", ") unless record.doctors_name.blank?
  end
end
