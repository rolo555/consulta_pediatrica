require 'test_helper'

class SurgeryTest < ActiveSupport::TestCase
  should have_many(:images)#.dependent(:destroy)
  should have_one :income
end
