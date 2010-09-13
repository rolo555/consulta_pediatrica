require 'test_helper'

class EmailTest < Test::Unit::TestCase
  should validate_presence_of :address
  should belong_to :patient

  should_not allow_value("mail").for(:address)
  should_not allow_value("mail@").for(:address)
  should_not allow_value("@mail").for(:address)
  should_not allow_value("mail.com").for(:address)
  should_not allow_value("@.com").for(:address)
  should_not allow_value("mail@com").for(:address)


  def test_to_label
    mail = Email.new(:address => "mail@mail.com")
    assert_equal(mail.to_label, "mail@mail.com");
  end

  def sanitizate(f)
    eval(
      "
      def sanitizate_#{f}
        mail = Email.new(:address => ' mail@mail.com ')
        mail.before_validation
        assert_equal('mail@mail.com', mail.instance_eval('#{f}'))
      end
      "
    )
    eval("sanitizate_#{f}")
  end

  should "sanitizate address" do
    sanitizate("address")
  end

end
