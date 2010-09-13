require 'test_helper'

class PhoneNumberTest < ActiveSupport::TestCase

  should belong_to(:patient)
  should validate_presence_of :number

  def test_to_label
    p_number = PhoneNumber.new(:number => "123")
    assert_equal(p_number.to_label, "123")
  end

  should "sanitizate phone_number" do
    sanitizate("number")
  end

end
