module Old
class SurgicalRecord < OldDB
  
  belongs_to :patient,
    :class_name => "Patient",
    :foreign_key => "patient_id"
  
  validates_presence_of :date, :patient_id, :pathology, :procedure ,:message => " no se puede dejar en blanco"
  
  def to_label
    "#{procedure}"
  end
  
  def table_name
    "surgical_records"
  end
  
  def to_string
    "#{procedure}"
  end  
  
  def search_field
    keywords = []
    keywords << pathology
    keywords << procedure
    keywords.to_s
  end  
  
end
end