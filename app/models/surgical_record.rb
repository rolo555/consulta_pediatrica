include ModelHelper

class SurgicalRecord < ActiveRecord::Base

  protected :before_validation

  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :pathology, :procedure
  validates_length_of :pathology, :maximum => 50, :if => "self.pathology.presence"
  validates_length_of :procedure, :maximum => 50, :if => "self.procedure.presence"
  validates_uniqueness_of :pathology, :case_sensitive => false
#  validate :date_must_be_lower_than_tomorrow

  def to_label
    "#{pathology} #{procedure}"
  end

  def before_validation
    sanitizate_strings :pathology, :procedure
  end

#  def date_must_be_lower_than_tomorrow
#    unless self.date.nil?
#      if (self.date <=> Date.today) > 0
#        errors.add :date, 'can\'t be greater than today'
#      end
#    end
#  end

end
