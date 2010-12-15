class VaccineSchedule < ActiveRecord::Base
  validates_presence_of :vaccine_name_id, :type, :days
end
