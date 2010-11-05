require 'test_helper'

class HospitalExpenseTest < ActiveSupport::TestCase
  should validate_presence_of :concept
  should validate_presence_of :price
  should validate_uniqueness_of(:concept).case_insensitive
  should ensure_length_of(:concept).is_at_most(50)
  should validate_numericality_of(:price)
  should_not allow_value(9.99).for(:price)
  should_not allow_value(-1).for(:price)

  should have_and_belong_to_many :surgery_quotations

  valid_method_should_call_clean_whitespaces_of_all_strings HospitalExpense

  context 'to_label method' do
    should 'return address' do
      hospital_expense = HospitalExpense.new :concept => 'Nurse', :price => 100
      assert_equal 'Nurse 100', hospital_expense.to_label
    end
  end
end
