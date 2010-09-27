class PathologicalRecord < ActiveRecord::Base
  #Relations
  belongs_to :patient

  validates_presence_of :diagnosis, :treatment
  validates_length_of :deagnosis, :treatment, :maximum => 50, :allow_nil => true
end
