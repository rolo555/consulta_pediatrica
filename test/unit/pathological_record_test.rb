require 'test_helper'

class PathologicalRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :diagnosis
  should validate_presence_of :treatment
end
