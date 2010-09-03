class PhoneNumber < ActiveRecord::Base
  belongs_to :patient

  def to_label
    number
  end
end
