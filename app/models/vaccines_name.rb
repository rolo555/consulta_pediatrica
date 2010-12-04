include ModelHelper

class VaccinesName < ActiveRecord::Base
  protected :before_validation

  #Relaciones
  has_many :vaccines

  #Validaciones
  validates_presence_of :name
  validates_length_of :name, :maximum => 50, :if => "self.name.presence"
  validates_uniqueness_of :name, :case_sensitive => false

  def to_label
    "#{name}"
  end

  def before_validation
    sanitizate_strings :name
  end
end
