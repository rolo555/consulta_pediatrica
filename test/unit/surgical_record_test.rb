require 'test_helper'

class SurgicalRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :pathology
  should validate_presence_of :procedure
  should_not allow_value(@long_string).for(:pathology)
  should_not allow_value(@long_string).for(:procedure)

  context "to_label" do
    should "concat pathology and procedure" do
      surgical_record = surgical_records(:one)
      assert_equal(surgical_record.to_label, "pathology procedure");
    end
  end

  should "sanitizate pathology" do
    sanitizate("pathology")
  end

  should "sanitizate procedure" do
    sanitizate("procedure")
  end
end
