require 'test_helper'

class SurgeryQuotationTest < ActiveSupport::TestCase
  should belong_to :consultation
  should have_and_belong_to_many :hospital_expenses
end
