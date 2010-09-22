module PatientsHelper
  def patient_consultations_column(record)
    image_tag "icons/consultation.jpg", :title => "Consultations"
  end
  def patient_family_records_column(record)
    image_tag "icons/familyRecord.gif", :title => "Family Records"
  end
  def patient_allergies_column(record)
    if record.allergies.empty?
      image_tag "icons/noAllergy.png", :title => "Allergies"
    else
      image_tag "icons/allergy.png", :title => "Allergies"
    end
  end
  def patient_perinatal_record_column(record)
    image_tag "icons/perinatalRecord.png", :title => "Perinatal Records"
  end
end
