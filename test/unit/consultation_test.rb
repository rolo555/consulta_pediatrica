require 'test_helper'

class ConsultationTest < ActiveSupport::TestCase
  should belong_to :patient
  should have_many(:images).dependent(:destroy)
  should have_many(:surgery_quotations).dependent(:destroy)
  should have_one :income

  [:weight, :height, :head_circumference, :temperature, :amount].each do |field|
    should validate_numericality_of field
  end

  [:weight, :height, :head_circumference, :temperature, :amount].each do |field|
    should_not allow_value(-1).for field
  end

  [:weight, :height, :head_circumference, :temperature, :amount, :anterior_fontanel].each do |field|
    should allow_value(nil).for field
  end
  
  context "A new instance of consultation" do
    should "copy patient.amount to amount if patient exists" do
      patient = Patient.new
      patient.stubs(:amount).returns(123)
      patient.stubs(:new_record?).returns(true)
      consultation = Consultation.new :patient => patient
      assert_equal 123, consultation.amount
    end
  end
end