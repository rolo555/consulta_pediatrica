module Old
class Vaccine < OldDB
  
  belongs_to :patient,
    :class_name => "Patient",
    :foreign_key => "patient_id"
  
  validates_presence_of :name, :patient_id, :message => " no se puede dejar en blanco"
  validates_uniqueness_of :name, :scope => :patient_id, :message => " ya existe esa vacuna para el paciente"
  
  def to_label
    "#{name}"
  end
  
  def table_name
    "vaccines"
  end
  
  def to_string
    "#{name}"
  end  
  
  def search_field
    keywords = []
    keywords << name
    keywords.to_s
  end  
  
  
end
end