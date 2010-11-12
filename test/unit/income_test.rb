require 'test_helper'

class IncomeTest < ActiveSupport::TestCase
  should belong_to :payment
end
