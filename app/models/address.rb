class Address < ActiveRecord::Base
  belongs_to :patient

  def to_label
    address
  end
  
end
