module Old
class Income < OldDB
  
  belongs_to :consultation,
    :class_name => "Consultation",
    :foreign_key => "consultation_id"
  
  belongs_to :surgery,
    :class_name => "Surgery",
    :foreign_key => "surgery_id"
  
  validates_presence_of :concept, :total_amount, :doctors_amount, :clinics_amount, :message => " no puede dejarse en blanco"
  validates_numericality_of :total_amount, :doctors_amount, :clinics_amount, :message => " no es un numero valido"
  
  def validate
    if !doctors_amount.nil? && !clinics_amount.nil? && !total_amount.nil?
      if  ( doctors_amount + clinics_amount ) != total_amount
        errors.add_to_base "El monto total debe ser la suma del monto del doctor y monto de la clinica" 
      end
    end
  end
  
  def to_label
    " #{concept}: #{total_amount} "
  end
  
  def table_name
    "incomes"
  end
  
  def to_string
    " #{concept}: #{total_amount} Bs." 
  end  
  
  def search_field
    keywords = []
    keywords << concept
    keywords.to_s
  end
  
  def comes_from?
    res = ""
    if !self.consultation.nil?
      res = self.consultation.diagnosis  
    elsif !self.surgery.nil?   
      res = self.surgery.procedure
    end
    res
  end
  
end
end