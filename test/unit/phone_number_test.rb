require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :number
  should ensure_length_of(:number).is_at_most(50)

  context "to_label" do
    should "be the number" do
      phone_number = phone_numbers :one
      assert_equal phone_number.to_label, "720 12345";
    end
  end

  valid_method_should_call_clean_whitespaces_of_all_strings PhoneNumber

end
