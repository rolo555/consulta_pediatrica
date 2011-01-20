module ImmunizationRecordsHelper
  def immunization_record_application_records_resume_show_column(record)
    dosis = ApplicationRecord.all(:conditions => {:immunization_record_id => record.id, :application_type => "dosis"}, :order => :date)
    refuerzos = ApplicationRecord.all(:conditions => {:immunization_record_id => record.id, :application_type => "refuerzo"}, :order => :date)
    list = []
    dosis.each_index { |index| list << content_tag("li", "#{as_(:dosis)[index+1]} #{dosis[index].to_label}")}
    refuerzos.each_index { |index| list << content_tag("li", "#{as_(:refuerzos)[index+1]} #{refuerzos[index].to_label}")}
    content_tag "ul", list.join(" ")
  end
end
