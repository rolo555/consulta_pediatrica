require 'test_helper'

class HospitalExpenseTest < ActiveSupport::TestCase
  should validate_presence_of :concept
  should validate_presence_of :price
  should validate_uniqueness_of(:concept).case_insensitive
  should_not allow_value(long_string).for(:concept)
  should validate_numericality_of(:price)
  should_not allow_value(9.99).for(:price)
  should_not allow_value(-1).for(:price)

  should "sanitizate concept" do
    sanitizate "concept"
  end

end
