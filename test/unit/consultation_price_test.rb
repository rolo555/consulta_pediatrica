require 'test_helper'

class ConsultationPriceTest < ActiveSupport::TestCase
  should have_many(:patients)

  should validate_uniqueness_of(:price_type).case_insensitive

  should validate_presence_of :price_type
  should validate_presence_of :amount

  should validate_numericality_of(:amount)  
  should_not allow_value(-1).for(:amount)

  should ensure_length_of(:price_type).is_at_most(50)

  valid_method_should_call_clean_whitespaces_of_all_strings ConsultationPrice

  should "swap default consultation_price" do
    consultation_price = consultation_prices :two
    consultation_price.default = true
    consultation_price.save!
    assert_equal true, consultation_prices(:two).default
    assert_equal false, consultation_prices(:one).default
  end

  should "not swap default consultation_price" do
    consultation_price = consultation_prices :two
    consultation_price.default = true
    ConsultationPrice.stubs(:find_by_default).with(true).returns(nil)
    consultation_price.save!
    assert_equal true, consultation_prices(:two).default
  end

  context 'to_label method' do
    should 'return price_type and amount' do
      consultation_price = ConsultationPrice.new :price_type => "Casi gratis", :amount => 1
      assert_equal 'Casi gratis - 1.0', consultation_price.to_label
    end
  end
end