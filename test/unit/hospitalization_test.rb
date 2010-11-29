require 'test_helper'

class HospitalizationTest < ActiveSupport::TestCase
  should have_many(:hospitalization_follow_ups)
  should have_many(:doctors_names)
  valid_method_should_call_clean_whitespaces_of_all_strings Hospitalization
end
