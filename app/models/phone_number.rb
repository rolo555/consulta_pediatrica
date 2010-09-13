class PhoneNumber < ActiveRecord::Base
  belongs_to :patient
  validates_presence_of :number

  def to_label
    number
  end

  def before_validation
    self.number.strip! if self.number.presence
  end

end
