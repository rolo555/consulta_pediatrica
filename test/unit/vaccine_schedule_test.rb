require 'test_helper'

class VaccineScheduleTest < ActiveSupport::TestCase
  should validate_presence_of :vaccine_name_id
  should validate_presence_of :type
  should validate_presence_of :days
end
