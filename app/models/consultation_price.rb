include ModelHelper

class ConsultationPrice < ActiveRecord::Base
  protected :before_validation

  #Relaciones
  has_many :patients

  #Validaciones
  validates_uniqueness_of :price_type, :case_sensitive => false
  validates_presence_of :price_type, :amount
  validates_numericality_of :amount, :greater_than_or_equal_to => 0
  validates_length_of :price_type, :maximum => 50, :if => "self.price_type.presence"
  validates_uniqueness_of :default, :if => :is_going_to_be_default
  validate :cant_exist_none_consultation_price_by_default

  def is_going_to_be_default
    self.default
  end

  def to_label
    "#{price_type} - #{amount}"
  end

  def before_validation
    sanitizate_strings :price_type
  end

  def cant_exist_none_consultation_price_by_default
    errors.add :default, as_("can\'t be false, because at least one consultation price must be default") if (self.default == false) and ConsultationPrice.find_by_default(true).nil?
  end

  before_destroy :require_validation_destroy

   def require_validation_destroy
    raise "Cannot delete consultation price with payments" if self.default
  end
  
end
