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

  def to_label
    "#{price_type} - #{amount}"
  end

  def before_validation
    sanitizate_strings :price_type
  end

  def before_save
    if self.default
      old_default_price = ConsultationPrice.find_by_default(true)
      if old_default_price.present?
        old_default_price.default = false
        old_default_price.save
      end
    end
  end

  before_destroy :require_validation_destroy

  def require_validation_destroy
    raise "Cannot delete consultation price with payments" if self.default
  end
  
end
