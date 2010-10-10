require 'test_helper'

class PathologicalRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :diagnosis
  should validate_presence_of :treatment
  should_not allow_value(long_string).for(:diagnosis)
  should_not allow_value(long_string).for(:treatment)
  should_not allow_value(Date.tomorrow).for(:date)

  should "sanitizate diagnosis" do
    sanitizate "diagnosis"
  end

  should "sanitizate treatment" do
    sanitizate "treatment"
  end

end
