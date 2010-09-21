class FamilyRecord < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :pathology
  validates_presence_of :relation_ship

end
