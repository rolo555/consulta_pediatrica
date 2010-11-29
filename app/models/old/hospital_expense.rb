module Old
class HospitalExpense < OldDB

  has_and_belongs_to_many :surgery_quotations
   # :class_name => "HospitalExpense",
   # :join_table => "hospital_expenses_surgery_quotations",
    #:foreign_key => "hospital_expense_id",
   # :association_foreign_key => "surgery_quotation_id"
 
  validates_presence_of :concept, :price, :message => "  no se puede dejar en blanco"
  validates_numericality_of :price, :message => " no es un numero valido" 
  validates_uniqueness_of :concept, :message => " ya existe el gasto de hospital"
  
  def to_label
    "#{concept}"
  end
  
  def table_name
    "hospital_expenses"
  end
  
  def to_string
    " #{concept}" unless !self.valid?
  end  
  
  def search_field
    keywords = []
    keywords << concept unless self.valid?
    keywords.to_s
  end
  
  
end
end