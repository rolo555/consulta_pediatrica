require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  should validate_presence_of :address
  should belong_to :patient

  should_not allow_value("mail").for(:address)
  should_not allow_value("mail@").for(:address)
  should_not allow_value("@mail").for(:address)
  should_not allow_value("mail.com").for(:address)
  should_not allow_value("@.com").for(:address)
  should_not allow_value("mail@com").for(:address)
  should ensure_length_of(:address).is_at_most(50)

  def test_to_label
    mail = Email.new(:address => "mail@mail.com")
    assert_equal(mail.to_label, "mail@mail.com");
  end

  should "sanitizate address" do
    sanitizate("address")
  end
end
