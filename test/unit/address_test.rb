require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  should belong_to(:patient)
  should validate_presence_of :address

  def test_to_label
    address = Address.new(:address => "Antezana")
    assert_equal(address.to_label, "Antezana");
  end

  should "sanitizate address" do
    sanitizate("address")
  end

end
