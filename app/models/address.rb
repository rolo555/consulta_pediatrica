class Address < ActiveRecord::Base
  belongs_to :patient

  def to_label
    address
  end

  validates_presence_of :address

  def before_validation
    self.address.strip! if self.address.presence
  end

end
