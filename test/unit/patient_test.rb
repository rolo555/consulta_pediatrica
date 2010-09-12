require 'test_helper'

class PatientTest < Test::Unit::TestCase
  should validate_presence_of :first_name
end
