include ModelHelper

class PhoneNumber < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :number
  validates_length_of :number, :maximum => 50, :if => "self.number.presence"

  def to_label
    number.to_s
  end

  def before_validation
    clean_whitespaces self.number
  end
end
