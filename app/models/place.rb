include ModelHelper

class Place < ActiveRecord::Base
  #Relaciones
  has_many :patients

  #Validaciones
  validates_presence_of :city, :country
  validates_uniqueness_of :city,
    :scope => [:country],
    :case_sensitive => false

  def to_label
    "#{city} #{country}"
  end

  def before_validation
    clean_whitespaces self.city,
      self.country
  end
end
