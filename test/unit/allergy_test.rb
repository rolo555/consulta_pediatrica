require 'test_helper'

class AllergyTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :substance
  should validate_presence_of :reaction
end
