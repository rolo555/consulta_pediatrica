require 'test_helper'

class SurgicalRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :pathology
  should validate_presence_of :procedure
  should_not allow_value(@long_string).for(:pathology)
  should_not allow_value(@long_string).for(:procedure)
end
