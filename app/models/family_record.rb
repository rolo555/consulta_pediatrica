class FamilyRecord < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :pathology, :relation_ship
  validates_length_of :pathology, :maximum => 50, :if => "self.pathology.presence"
  validates_length_of :relation_ship, :maximum => 50, :if => "self.relation_ship.presence"


  def before_validation
    clean_whitespaces self.pathology, self.relation_ship
  end
end
