require 'test_helper'

class ConsultationPriceTest < ActiveSupport::TestCase
  should validate_presence_of :price_type
  should validate_presence_of :amount
  should ensure_length_of(:price_type).is_at_most(50)
  should validate_numericality_of(:amount)
  should have_many(:patients)
  should validate_uniqueness_of(:price_type).case_insensitive
  should_not allow_value(9.99).for(:amount)
  should_not allow_value(-1).for(:amount)

  valid_method_should_call_clean_whitespaces_of_all_strings ConsultationPrice

  def is_going_to_be_default_test
    cp = ConsultationPrice.new(:default => true)
    assert_equal(cp.is_going_to_be_default, true);
  end

  should "not allow none default consultation price" do
    ConsultationPrice.stubs(:find_by_default).with(true).returns(nil)
    consultation_price = consultation_prices :two
    consultation_price.valid?
    assert_not_equal nil, consultation_price.errors[:default]
  end

  context 'to_label method' do
    should 'return price_type and amount' do
      consultation_price = ConsultationPrice.new :price_type => "Casi gratis", :amount => 1
      assert_equal 'Casi gratis - 1', consultation_price.to_label
    end
  end
end