require 'test_helper'

class ConsultationPriceTest <  Test::Unit::TestCase
  should validate_presence_of :price_type
  should validate_presence_of :amount
  should have_many(:patients)
  should validate_uniqueness_of(:price_type).case_insensitive
end
