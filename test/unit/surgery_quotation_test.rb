require 'test_helper'

class SurgeryQuotationTest < ActiveSupport::TestCase
  should belong_to :consultation
  should have_many(:hospital_expenses).dependent(:destroy)

  should validate_presence_of :days_of_hospitalization
  should validate_presence_of :hospital_expenses
  should validate_presence_of :medical_expenses
  should validate_presence_of :surgery_time

  should validate_numericality_of :days_of_hospitalization
  should_not allow_value(1.5).for(:days_of_hospitalization)
  should_not allow_value(0).for(:days_of_hospitalization)

  should validate_numericality_of :medical_expenses
  should_not allow_value(0).for(:medical_expenses)

  should validate_numericality_of :surgery_time
  should_not allow_value(0).for(:surgery_time)
end
