include ModelHelper

class Hospitalization < ActiveRecord::Base
  protected :before_validation

  #Relaciones
  belongs_to :patient
  has_many :doctors_name, :dependent => :destroy

  #Validaciones
  validates_presence_of :room
  validates_length_of :room, :maximum => 50, :unless => "room.blank?"

  def before_validation
    sanitizate_strings :room
  end

#  def to_label
#    "#{hospitalization.patient} #{room}"
#  end

end
