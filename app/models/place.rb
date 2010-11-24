include ModelHelper

class Place < ActiveRecord::Base
  protected :before_validation

  #Relaciones
  has_many :patients

  #Validaciones
  validates_presence_of :city, :country
  validates_length_of :city, :maximum => 50, :if => "self.city.presence"
  validates_length_of :country, :maximum => 50, :if => "self.country.presence"
  validates_uniqueness_of :city,
    :scope => [:country],
    :case_sensitive => false

  def to_label
    "#{city} #{country}"
  end

  def before_validation
    sanitizate_strings :city, :country
  end
end