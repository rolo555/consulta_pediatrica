include ModelHelper

class PathologicalRecord < ActiveRecord::Base
  protected :before_validation

  #Relations
  belongs_to :patient

  validates_presence_of :diagnosis, :treatment
  validates_length_of :diagnosis, :maximum => 200, :if => "self.diagnosis.presence"
  validates_length_of :treatment, :maximum => 200, :if => "self.treatment.presence"
  validate :date_cant_be_greater_than_today, :date_cant_be_incomplete

  def before_validation
    sanitizate_strings :diagnosis, :treatment
  end

  def date_cant_be_greater_than_today
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

  def to_label
    diagnosis
  end
end
