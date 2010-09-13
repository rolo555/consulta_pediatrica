require 'test_helper'

class AddressTest < Test::Unit::TestCase
  should belong_to(:patient)
  should validate_presence_of :address

  def test_to_label
    address = Address.new(:address => "Antezana")
    assert_equal(address.to_label, "Antezana");
  end

  def sanitizate(f)
    eval(
      "
      def sanitizate_#{f}
        ads = Address.new(:address => ' a ')
        ads.before_validation
        assert_equal('a', ads.instance_eval('#{f}'))
      end
      "
    )
    eval("sanitizate_#{f}")
  end

  should "sanitizate address" do
    sanitizate("address")
  end

end
