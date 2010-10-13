include ModelHelper

class Email < ActiveRecord::Base

  #Relaciones
  belongs_to :patient

  #Validaciones
  validates_presence_of :address
  validates_format_of :address,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i
  validates_length_of :address, :maximum => 50, :if => "self.address.presence"

  def to_label
    address
  end

  def before_validation
    sanitizate_strings self.address
  end
  
end
