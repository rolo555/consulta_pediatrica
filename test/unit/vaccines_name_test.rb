require 'test_helper'

class VaccinesNameTest < ActiveSupport::TestCase
  should have_many :vaccine_schedule
end
