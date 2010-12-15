require 'test_helper'

class VaccineScheduleTest < ActiveSupport::TestCase
  should validate_presence_of :vaccines_name
  should validate_presence_of :application_type
  should validate_presence_of :days

  should belong_to :vaccines_name
end
