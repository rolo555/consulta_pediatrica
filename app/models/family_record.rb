include ModelHelper

class FamilyRecord < ActiveRecord::Base

  protected :before_validation
  
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :pathology, :relation_ship
  validates_length_of :pathology, :maximum => 50, :if => "self.pathology.presence"
  validates_length_of :relation_ship, :maximum => 50, :if => "self.relation_ship.presence"

  def before_validation
    sanitizate_strings :pathology, :relation_ship
  end

  #FIXME: FamilyRecord necesita método to_label
end
