require 'test_helper'

class DiagnosticTest < ActiveSupport::TestCase
  should validate_presence_of :name
  should validate_uniqueness_of :name
  should ensure_length_of(:name).is_at_most(50)

  valid_method_should_call_clean_whitespaces_of_all_strings Diagnostic

  context 'to_label method' do
    should 'return name' do
      diagnostic = Diagnostic.new :name => 'Sano'
      assert_equal 'Sano', diagnostic.to_label
    end
  end
end
