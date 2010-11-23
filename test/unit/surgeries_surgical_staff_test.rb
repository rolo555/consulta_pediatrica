require 'test_helper'

class SurgeriesSurgicalStaffTest < ActiveSupport::TestCase
  should belong_to :surgery
  should belong_to :surgical_staff

  should validate_presence_of :surgery
  should validate_presence_of :surgical_staff
  should validate_presence_of :name
end
