include ModelHelper

class LaboratoryProfile < ActiveRecord::Base

  protected :before_validation
  
  #Validaciones
  validates_presence_of :name, :text
  validates_length_of :name, :maximum => 50, :if => "self.name.presence"
  validates_uniqueness_of :name

  def before_validation
    sanitizate_strings :name
  end

  def to_label
    "#{name}"
  end
end
