include ModelHelper

class PathologicalRecord < ActiveRecord::Base

  protected :before_validation

  #Relations
  belongs_to :patient

  validates_presence_of :diagnosis, :treatment
  validates_length_of :diagnosis, :maximum => 50, :if => "self.diagnosis.presence"
  validates_length_of :treatment, :maximum => 50, :if => "self.treatment.presence"
  validate :date_must_be_lower_than_tomorrow

  def before_validation
    sanitizate_strings :diagnosis, :treatment
  end

  def date_must_be_lower_than_tomorrow
    unless self.date.nil?
      if (self.date <=> Date.today) > 0
        errors.add :date, 'can\'t be greater than today'
      end
    end
  end

  def to_label
    diagnosis
  end
end
