require 'test_helper'

class PhoneNumberTest <  Test::Unit::TestCase

  should belong_to(:patient)
  should validate_presence_of :number

  def test_to_label
    p_number = PhoneNumber.new(:number => "123")
    assert_equal(p_number.to_label, "123")
  end

  def sanitizate(f)
    eval(
      "
      def sanitizate_#{f}
        p_number = PhoneNumber.new(:number => ' 123 ')
        p_number.before_validation
        assert_equal('123', p_number.instance_eval('#{f}'))
      end
      "
    )
    eval("sanitizate_#{f}")
  end

  should "sanitizate phone_number" do
    sanitizate("number")
  end

end
