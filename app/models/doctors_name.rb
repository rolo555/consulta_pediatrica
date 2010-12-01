include ModelHelper

class DoctorsName < ActiveRecord::Base
  protected :before_validation

  #Relaciones
  belongs_to :hospitalization

  #Validaciones
  validates_presence_of :name
  validates_length_of :name, :maximum => 50, :unless => "name.blank?"

  def before_validation
    sanitizate_strings :name
  end

end
