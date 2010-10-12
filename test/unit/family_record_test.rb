require 'test_helper'

class FamilyRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :pathology
  should validate_presence_of :relation_ship
  should ensure_length_of(:pathology).is_at_most(50)
  should ensure_length_of(:relation_ship).is_at_most(50)

  should "sanitizate pathology" do
    sanitizate "pathology"
  end

  should "sanitizate relation_ship" do
    sanitizate "relation_ship"
  end

end
