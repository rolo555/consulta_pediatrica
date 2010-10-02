require 'test_helper'

class FamilyRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :pathology
  should validate_presence_of :relation_ship
  should_not allow_value(@long_string).for(:pathology)
  should_not allow_value(@long_string).for(:relation_ship)

  should "sanitizate pathology" do
    sanitizate "pathology"
  end

  should "sanitizate relation_ship" do
    sanitizate "relation_ship"
  end

end
