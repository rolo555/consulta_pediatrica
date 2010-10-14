require 'test_helper'

class SurgicalRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :pathology
  should validate_presence_of :procedure
  should ensure_length_of(:pathology).is_at_most(50)
  should ensure_length_of(:procedure).is_at_most(50)
  should validate_uniqueness_of(:pathology).case_insensitive
  should_not allow_value(Date.tomorrow).for(:date)

  context "to_label" do
    should "concat pathology and procedure" do
      surgical_record = surgical_records(:one)
      assert_equal(surgical_record.to_label, "pathology procedure");
    end
  end

  valid_method_should_call_clean_whitespaces_of_all_strings SurgicalRecord

end
