require 'test_helper'

class PatientPriceTest <  Test::Unit::TestCase
  shoudl validate_presence_of :price_type
  shoudl validate_presence_of :amount
  should have_may(:patients)
  should validete_uniqueness_of(:price_type).case_insensitive


end
