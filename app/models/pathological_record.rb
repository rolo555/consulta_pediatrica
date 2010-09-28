class PathologicalRecord < ActiveRecord::Base
  #Relations
  belongs_to :patient

  validates_presence_of :diagnosis, :treatment
  validates_length_of :diagnosis, :treatment, :maximum => 50, :allow_nil => true

  def before_validation
    clean_whitespaces self.diagnosis, self.treatment
  end
end
