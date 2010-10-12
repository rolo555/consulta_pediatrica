require 'test_helper'

class LaboratoryProfileTest < ActiveSupport::TestCase
  should validate_presence_of :name
  should validate_presence_of :text
  should ensure_length_of(:name).is_at_most(50)

  should "sanitizate name" do
    sanitizate "name"
  end

end
