class PathologicalRecord < ActiveRecord::Base
  #Relations
  belongs_to :patient

  validates_presence_of :diagnosis, :treatment
  validates_length_of :diagnosis, :maximum => 50, :if => "self.diagnosis.presence"
  validates_length_of :treatment, :maximum => 50, :if => "self.treatment.presence"


  def before_validation
    clean_whitespaces self.diagnosis, self.treatment
  end
end
