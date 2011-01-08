include ModelHelper

class SurgicalRecord < ActiveRecord::Base

  protected :before_validation

  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :pathology, :procedure
  validates_length_of :pathology, :maximum => 100, :if => "self.pathology.presence"
  validates_uniqueness_of :pathology, :case_sensitive => false, :scope => :patient_id
  validate :date_must_be_lower_than_tomorrow, :date_cant_be_incomplete

  def to_label
    "#{pathology} #{procedure}"
  end

  def before_validation
    sanitizate_strings :pathology
  end

  def date_must_be_lower_than_tomorrow
    unless self.date.nil?
      if (self.date <=> Date.today) > 0
        errors.add :date, 'can\'t be greater than today'
      end
    end
  end

  def date_cant_be_incomplete
    if self.day.present? and self.month.blank?
      errors.add :date, 'can\'t select a day without a month'
    end
    if self.month.present? and self.year.blank?
      errors.add :date, 'can\'t select a month without a year'
    end
  end
end
