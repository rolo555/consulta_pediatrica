class VaccineSchedule < ActiveRecord::Base
  validates_presence_of :vaccines_name, :application_type, :days
  belongs_to :vaccines_name
end
