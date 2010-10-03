require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :number
  should_not allow_value(long_string).for(:number)

  context "to_label" do
    should "be the number" do
      phone_number = phone_numbers :one
      assert_equal phone_number.to_label, "720 12345";
    end
  end

  should "sanitizate phone_number" do
    sanitizate "number"
  end
end
