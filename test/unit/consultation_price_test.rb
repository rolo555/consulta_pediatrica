require 'test_helper'

class ConsultationPriceTest < ActiveSupport::TestCase
  should validate_presence_of :price_type
  should validate_presence_of :amount
  should validate_numericality_of(:amount)
  should have_many(:patients)
  should validate_uniqueness_of(:price_type).case_insensitive

  def test_to_label
    c_price = ConsultationPrice.new(:price_type => "price type", :amount => 1.0 )
    assert_equal(c_price.to_label, "Type of Price: price type\nAmount: 1.0");
  end

  should "sanitizate price_type" do
    sanitizate("price_type")
  end

  context "amount" do
    should "be integer" do
      price = consultation_prices(:non_integer)
      price.save
      assert_equal false, price.valid?
    end
  end
end
