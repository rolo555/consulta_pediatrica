class Allergy < ActiveRecord::Base

  protected :before_validation

  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :substance, :reaction
  validates_length_of :substance, :maximum => 50, :if => "self.substance.presence"
  validates_length_of :reaction, :maximum => 50, :if => "self.reaction.presence"

  validates_uniqueness_of :substance, :case_sensitive => false

  def before_validation
    sanitizate_strings :substance, :reaction
  end

  def to_label
    "#{substance}"
  end

end
