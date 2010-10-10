require 'test_helper'

class LaboratoryProfileTest < ActiveSupport::TestCase
  should validate_presence_of :name
  should validate_presence_of :text
  should_not allow_value(long_string).for(:name)

  should "sanitizate name" do
    sanitizate "name"
  end

end
