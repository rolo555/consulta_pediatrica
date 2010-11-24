require 'test_helper'

class SurgicalStaffTest < ActiveSupport::TestCase
  should have_many :surgeries_surgical_staffs

  should validate_presence_of :staff
  should ensure_length_of(:staff).is_at_most(50)
  should validate_uniqueness_of(:staff).case_insensitive

  valid_method_should_call_clean_whitespaces_of_all_strings SurgicalStaff

  context 'to_label method' do
    should 'return staff' do
      surgical_staff = SurgicalStaff.new :staff => 'abc'
      assert_equal 'abc', surgical_staff.to_label
    end
  end
end
