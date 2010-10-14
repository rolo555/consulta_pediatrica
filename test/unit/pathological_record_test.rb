require 'test_helper'

class PathologicalRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :diagnosis
  should validate_presence_of :treatment
  should ensure_length_of(:diagnosis).is_at_most(50)
  should ensure_length_of(:treatment).is_at_most(50)
  should_not allow_value(Date.tomorrow).for(:date)

  valid_method_should_call_clean_whitespaces_of_all_strings PathologicalRecord

  context 'to_label method' do
    should 'return diagnosis' do
      pathological_record = PathologicalRecord.new :diagnosis => 'Resfrío'
      assert_equal 'Resfrío', pathological_record.to_label
    end
  end
end
