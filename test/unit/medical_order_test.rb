require 'test_helper'

class MedicalOrderTest < ActiveSupport::TestCase
  should validate_presence_of :name
  should validate_presence_of :text
  should ensure_length_of(:name).is_at_most(50)
  should validate_uniqueness_of :name

  valid_method_should_call_clean_whitespaces_of_all_strings MedicalOrder

  context 'to_label method' do
    should 'return name' do
      medical_order = MedicalOrder.new :name => 'Nebulizaciones'
      assert_equal 'Nebulizaciones', medical_order.to_label
    end
  end
end
