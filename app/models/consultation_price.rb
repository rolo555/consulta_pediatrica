include ModelHelper

class ConsultationPrice < ActiveRecord::Base
  #Relaciones
  has_many :patients

  #Validaciones
  validates_uniqueness_of :price_type, :case_sensitive => false
  validates_presence_of :price_type, :amount
  validates_numericality_of :amount, :only_integer => true

  def to_label
    "Type of Price: #{price_type}\nAmount: #{amount}"
  end

  def before_validation
    clean_whitespaces self.price_type
  end

end
