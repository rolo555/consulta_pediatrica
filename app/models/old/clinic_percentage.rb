module Old
class ClinicPercentage < OldBD
  
  validates_presence_of :date, :percentage, :message => " no puede dejarse en blanco"
  validates_uniqueness_of :date, :message => " ya exite un porcentaje para la clinica en esa fecha"
  validates_uniqueness_of :is_active, :if => :is_going_to_be_active ,:message => "  ya existe un porcentaje activo para la clinica"
  validates_numericality_of :percentage, :greater_than => 0, :message => " debe ser mayor a 0"
  validates_numericality_of :percentage,  :less_than => 100, :message => " debe ser menor a 100"
  validates_numericality_of :percentage,  :only_integer => true, :message => " debe ser un numero entero"
  
  def is_going_to_be_active
    self.is_active
  end
  
  def to_label
    "#{date.strftime("%d-%m-%Y")} #{percentage}" unless date.nil?
  end
  
  def table_name
    "clinic_percentages"
  end
  
  def to_string
    "#{date.strftime("%d-%m-%Y")} #{percentage}" unless date.nil?
  end  
  
  def search_field
    keywords = []
    keywords << date.strftime("%d-%m-%Y") unless date.nil?
    keywords << percentage
  end
  
end
end