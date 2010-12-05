module PatientsHelper
  def patient_consultations_column(record)
    image_tag "icons/consultation.jpg", :title => plural_for(Consultation)
  end

  def patient_family_records_column(record)
    image_tag "icons/familyRecord.gif", :title => plural_for(FamilyRecord)
  end

  def patient_allergies_column(record)
    if record.allergies.empty?
      icon = "icons/noAllergy.png"
    else
      icon = "icons/allergy.png"
    end
    image_tag icon, :title => plural_for(Allergy)
  end

  def patient_perinatal_record_column(record)
    image_tag "icons/perinatalRecord.png", :title => plural_for(PerinatalRecord)
  end

  def patient_surgical_records_column(record)
    image_tag "icons/surgicalRecord.png", :title => plural_for(SurgicalRecord)
  end

  def patient_pathological_records_column(record)
    image_tag "icons/pathologicalRecord.png", :title => plural_for(PathologicalRecord)
  end

  def patient_surgeries_column(record)
    image_tag "icons/surgery.png", :title => plural_for(Surgery)
  end

  def patient_hospitalizations_column(record)
    image_tag "icons/hospitalization.png", :title => plural_for(Hospitalization)
  end

  def patient_immunization_records_column(record)
    image_tag "icons/immunizationRecord.png", :title => plural_for(ImmunizationRecord)
  end

end
