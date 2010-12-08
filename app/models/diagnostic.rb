class Diagnostic < ActiveRecord::Base
  #Relaciones
  has_and_belongs_to_many :drugs

  protected :before_validation

  #Validaciones
  validates_presence_of :name
  validates_length_of :name, :maximum => 50, :if => "self.name.presence"
  validates_uniqueness_of :name

  def before_validation
    sanitizate_strings :name
  end

  def to_label
    "#{name}"
  end
end
