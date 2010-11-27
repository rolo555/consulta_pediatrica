require 'test_helper'

class SurgeryQuotationTest < ActiveSupport::TestCase
  should belong_to :consultation
  should have_many(:hospital_expenses).dependent(:destroy)

  should validate_presence_of :days_of_hospitalization
  should validate_presence_of :hospital_expenses
  should validate_presence_of :medical_expenses
  should validate_presence_of :surgery_time

  [:days_of_hospitalization, :medical_expenses, :surgery_time].each do |field|
    should validate_numericality_of field
    should_not allow_value(-1).for field
  end

  should_not allow_value(1.5).for(:days_of_hospitalization)
  should allow_value(0).for :medical_expenses
  should allow_value(0).for :surgery_time

  context "to_label" do
    should "return class_name created at date" do
      created_date = Time.now
      surgery_quotation = SurgeryQuotation.new :created_at => created_date
      class_name = SurgeryQuotation.new.class.human_name
      created_at = I18n.t(:created_at, :scope => :attributes).downcase
      date = I18n.l surgery_quotation.created_at, :format => :short
      assert_equal "#{class_name} #{created_at} #{date}", surgery_quotation.to_label
    end
  end

  context "total_expenses" do
    should "return class_name created at date" do
      medical_expenses = 100
      hospital_expenses = [200, 99, 1].map { |price| stub(:price => price) }
      surgery_quotation = SurgeryQuotation.new
      surgery_quotation.stubs(:medical_expenses => medical_expenses,
        :hospital_expenses => hospital_expenses)
      assert_equal 400, surgery_quotation.total_expenses
    end
  end

  context "after_initialize" do
    should "copy the all hospital expeneses always used to hospital expenses" do
      hospital_expenses = 3.times.map { HospitalExpense.new }
      HospitalExpense.stubs(:find_all_by_is_always_used).with(true).returns(hospital_expenses)
      surgery_quotation = SurgeryQuotation.new
      assert_equal hospital_expenses, surgery_quotation.hospital_expenses
    end
  end
end
