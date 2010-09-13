class Address < ActiveRecord::Base
  belongs_to :patient
  validates_presence_of :address

  def to_label
    address
  end

  def before_validation
    self.address.strip! if self.address.presence
  end

end
