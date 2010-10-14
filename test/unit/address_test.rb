require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  
  should belong_to(:patient)
  should validate_presence_of :address
  should ensure_length_of(:address).is_at_most(100)

  context 'to_label method' do
    should 'return address' do
      address = Address.new :address => 'Villa cuchillo'
      assert_equal 'Villa cuchillo', address.to_label
    end
  end

  valid_method_should_call_clean_whitespaces_of_all_strings Address
end
