require 'test_helper'

class FamilyRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :pathology
  should validate_presence_of :relation_ship

end
