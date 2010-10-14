require 'test_helper'

class FamilyRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :pathology
  should validate_presence_of :relation_ship
  should ensure_length_of(:pathology).is_at_most(50)
  should ensure_length_of(:relation_ship).is_at_most(50)

  valid_method_should_call_clean_whitespaces_of_all_strings FamilyRecord
end
