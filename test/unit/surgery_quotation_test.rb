require 'test_helper'

class SurgeryQuotationTest < ActiveSupport::TestCase
  should belong_to :consultation
end
