class SurgicalRecord < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :pathology, :procedure
  validates_length_of :pathology, :maximum => 50, :if => "self.pathology.presence"
  validates_length_of :procedure, :maximum => 50, :if => "self.procedure.presence"
  validates_uniqueness_of :pathology, :case_sensitive => false

  def to_label
    "#{pathology} #{procedure}"
  end

  protected
  def before_validation
    clean_whitespaces self.pathology, self.procedure
  end
end
