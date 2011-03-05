include ModelHelper

class Allergy < ActiveRecord::Base

  protected :before_validation

  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :substance, :reaction
  validates_length_of :substance, :maximum => 50, :if => "self.substance.present?"
  validates_length_of :reaction, :maximum => 50, :if => "self.reaction.present?"

  validates_uniqueness_of :substance, :case_sensitive => false, :scope => :patient_id

  def before_validation
    sanitizate_strings :substance, :reaction
  end

  def to_label
    "#{substance}"
  end
end
