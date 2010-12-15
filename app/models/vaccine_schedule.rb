class VaccineSchedule < ActiveRecord::Base
  validates_presence_of :vaccines_name, :type, :days
  belongs_to :vaccines_name
end
