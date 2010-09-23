class PathologicalRecord < ActiveRecord::Base
  #Relations
  belongs_to :patient

  validates_presence_of :diagnosis
  validates_presence_of :treatment
end
