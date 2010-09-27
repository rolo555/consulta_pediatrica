include ModelHelper

class PhoneNumber < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :number
  validates_length_of :numer, :maximum => 50, :allow_nil => true

  def to_label
    number
  end

  def before_validation
    clean_whitespaces self.number
  end

end
