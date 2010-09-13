class Email < ActiveRecord::Base
  belongs_to :patient
  validates_presence_of :address

  validates_format_of :address,
    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

  def to_label
    address
  end

  def before_validation
    self.address.strip! if self.address.presence
  end
  
end
