class FamilyRecord < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :pathology, :relation_ship
  validates_length_of :pathology, :relation_ship, :maximum => 50, :allow_nil => true

end
