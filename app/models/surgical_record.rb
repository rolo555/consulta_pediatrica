class SurgicalRecord < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  validates_presence_of :pathology, :procedure
  validates_length_of :pathology, :procedure, :maximum => 50, :allow_nil => true

end
