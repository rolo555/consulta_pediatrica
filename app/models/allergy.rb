class Allergy < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :substance
  validates_presence_of :reaction
end
