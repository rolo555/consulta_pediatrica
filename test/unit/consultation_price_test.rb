require 'test_helper'

class ConsultationPriceTest < ActiveSupport::TestCase
  should validate_presence_of :price_type
  should validate_presence_of :amount
  should_not allow_value(@long_string).for(:price_type)
  should validate_numericality_of(:amount)
  should have_many(:patients)
  should validate_uniqueness_of(:price_type).case_insensitive
  should_not allow_value(9.99).for(:amount)
  should_not allow_value(-1).for(:amount)

  def is_going_to_be_default_test
    cp = ConsultationPrice.new(:default => true)
    assert_equal(cp.is_going_to_be_default, true);
  end

  def test_to_label
    c_price = ConsultationPrice.new(:price_type => "price type", :amount => 1.0 )
    assert_equal("Type of Price: price type\nAmount: 1", c_price.to_label);
  end

  should "sanitizate price_type" do
    sanitizate("price_type")
  end
end
