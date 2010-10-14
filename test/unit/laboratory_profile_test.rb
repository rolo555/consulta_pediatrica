require 'test_helper'

class LaboratoryProfileTest < ActiveSupport::TestCase
  should validate_presence_of :name
  should validate_presence_of :text
  should ensure_length_of(:name).is_at_most(50)

  valid_method_should_call_clean_whitespaces_of_all_strings LaboratoryProfile

  context 'to_label method' do
    should 'return name' do
      laboratory_profile = LaboratoryProfile.new :name => 'Muestra de sangre'
      assert_equal 'Muestra de sangre', laboratory_profile.to_label
    end
  end
end
