require 'test_helper'

class SurgeryTest < ActiveSupport::TestCase
  should have_many(:images).dependent(:destroy)
  should have_one(:income).dependent(:destroy)
  should have_many(:surgeries_surgical_staffs).dependent(:destroy)

  should validate_presence_of :surgeries_surgical_staffs
  should validate_presence_of :total_amount
  should validate_presence_of :doctors_percentage
  should ensure_length_of(:pre_operative_diagnosis).is_at_most(50)
  should ensure_length_of(:post_operative_diagnosis).is_at_most(50)

  should validate_numericality_of :total_amount
  should validate_numericality_of :hospital_amount
  should validate_numericality_of :doctors_percentage

  valid_method_should_call_clean_whitespaces_of_all_strings Surgery

  should "not allow hospital_amount greater than total_amount" do
    surgery = Surgery.new :total_amount => 100, :hospital_amount => 1000
    surgery.valid?
    assert_not_nil surgery.errors[:hospital_amount]
  end

  should "create a surgery with default values" do
    surgery = Surgery.new
    assert_equal 0, surgery.total_amount
    assert_equal 0, surgery.hospital_amount
    assert_equal 56, surgery.doctors_percentage
    assert_equal true, surgery.surgeries_surgical_staffs.blank?
  end
end
