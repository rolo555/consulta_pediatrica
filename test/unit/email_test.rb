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

  valid_method_should_call_clean_whitespaces_of_all_strings Email

  context 'to_label method' do
    should 'return address' do
      email = Email.new :address => 'mail@mail.com'
      assert_equal 'mail@mail.com', email.to_label
    end
  end
end
