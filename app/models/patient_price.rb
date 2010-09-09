class PatientPrice < ActiveRecord::Base
  has_many :patients
  validates_uniqueness_of :price_type
  validates_presence_of :price_type, :amount

  def to_label
    "Type of Price: #{price_type}\nAmount: #{amount}"
  end

end
