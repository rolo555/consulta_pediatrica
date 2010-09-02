class Email < ActiveRecord::Base
  belongs_to :patient

  def to_label
    address
  end

end
