class ConsultationPrice < ActiveRecord::Base
  has_many :patients
  validates_uniqueness_of :price_type, :case_sensitive => false
  validates_presence_of :price_type, :amount

  def to_label
    "Type of Price: #{price_type}\nAmount: #{amount}"
  end

    def before_validation
    self.price_type.strip! if self.price_type.presence
  end

end
