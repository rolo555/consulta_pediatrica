include ModelHelper

class ConsultationPrice < ActiveRecord::Base

  protected :before_validation

  #Relaciones
  has_many :patients

  #Validaciones
  validates_uniqueness_of :price_type, :case_sensitive => false
  validates_presence_of :price_type, :amount
  validates_numericality_of :amount, :only_integer => true, :greater_than_or_equal_to => 0
  validates_length_of :price_type, :maximum => 50, :if => "self.price_type.presence"
  validates_uniqueness_of :default, :if => :is_going_to_be_default

  def is_going_to_be_default
    self.default
  end

  def to_label
    "Type of Price: #{price_type}\nAmount: #{amount}"
  end

  def before_validation
    sanitizate_strings :price_type
  end

end
