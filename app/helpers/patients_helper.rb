module PatientsHelper
  def patient_consultations_column(record)
    image_tag "icons/consultation.jpg", :title => "Consultations"
  end
  def patient_family_records_column(record)
    image_tag "icons/familyRecord.gif", :title => "Family Records"
  end
end
