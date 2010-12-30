require 'test_helper'

class SurgicalRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :pathology
  should validate_presence_of :procedure
  should ensure_length_of(:pathology).is_at_most(50)
  should validate_uniqueness_of(:pathology).case_insensitive.scoped_to(:patient_id)
#  should_not allow_value(Date.tomorrow).for(:date)
  should_not allow_value(Date.today.year+1).for(:year)

  context "to_label" do
    should "return pathology and procedure" do
      surgical_record = SurgicalRecord.new :pathology => 'pathology',
        :procedure => 'procedure'
      assert_equal 'pathology procedure', surgical_record.to_label
    end
  end

  valid_method_should_call_clean_whitespaces_of_all_strings SurgicalRecord, [:day, :month, :year]
end
