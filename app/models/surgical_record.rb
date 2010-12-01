include ModelHelper

class SurgicalRecord < ActiveRecord::Base

  protected :before_validation

  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :pathology, :procedure
  validates_length_of :pathology, :maximum => 100, :if => "self.pathology.presence"
  validates_uniqueness_of :pathology, :case_sensitive => false, :scope => :patient_id
  validate :date_must_be_lower_than_tomorrow, :incomplite_date

  def to_label
    "#{pathology} #{procedure}"
  end

  def before_validation
    sanitizate_strings :pathology, :procedure
  end

  def date_must_be_lower_than_tomorrow
    unless self.date.nil?
      if (self.date <=> Date.today) > 0
        errors.add :date, 'can\'t be greater than today'
      end
    end
  end

  def incomplite_date
    unless self.day.blank?
      unless self.month.blank?
        if self.year.blank?
          errors.add :date, 'can\'t select a month without a year'
        end
      else
        errors.add :date, 'can\'t select a day without a month'
      end
    else
      unless self.month.blank?
        if self.year.blank?
          errors.add :date, 'can\'t select a month without a year'
        end
      end
    end
  end

end
