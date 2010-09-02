class Patient < ActiveRecord::Base
  has_many :emails, :dependent => :destroy
  has_many :consultations, :dependent => :destroy

  def to_label
    first_name + " " + last_name
  end

end
