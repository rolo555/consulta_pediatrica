class Allergy < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :substance, :reaction
  validates_length_of :substance, :reaction, :maximum => 50, :allow_nil => true
end
