include ModelHelper

class Address < ActiveRecord::Base
  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :address

  def to_label
    address
  end

  def before_validation
    clean_whitespaces self.address
  end

end
