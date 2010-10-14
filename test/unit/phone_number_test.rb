require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :number
  should ensure_length_of(:number).is_at_most(50)

  context "to_label" do
    should "return number" do
      phone_number = PhoneNumber.new :number => '123 45678'
      assert_equal '123 45678', phone_number.to_label
    end
  end

  valid_method_should_call_clean_whitespaces_of_all_strings PhoneNumber
end
