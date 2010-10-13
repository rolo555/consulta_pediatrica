include ModelHelper

class LaboratoryProfile < ActiveRecord::Base
  #Validaciones
  validates_presence_of :name, :text
  validates_length_of :name, :maximum => 50, :if => "self.name.presence"

  def before_validation
    sanitizate_strings self.name
  end

  def to_label
    "#{name}"
  end

end
