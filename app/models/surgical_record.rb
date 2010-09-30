class SurgicalRecord < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :pathology, :procedure
  validates_length_of :pathology, :procedure, :maximum => 50

  protected
  def before_validation
    clean_whitespaces self.pathology, self.procedure
  end
end
