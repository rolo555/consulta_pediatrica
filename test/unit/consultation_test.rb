require 'test_helper'

class ConsultationTest < ActiveSupport::TestCase
  neg = -1
  should belong_to :patient
  should have_many(:images)#.dependent(:destroy)
  should have_many(:surgery_quotations)#.dependent(:destroy)
  should have_one :income
  should validate_numericality_of :weight
  should_not allow_value(neg).for(:weight)
  should allow_value(nil).for(:weight)
  should validate_numericality_of :height
  should_not allow_value(neg).for(:height)
  should allow_value(nil).for(:height)
  should validate_numericality_of :head_circumference
  should_not allow_value(neg).for(:head_circumference)
  should allow_value(nil).for(:head_circumference)
  should validate_numericality_of :anterior_fontanel
  should_not allow_value(neg).for(:anterior_fontanel)
  should allow_value(nil).for(:anterior_fontanel)
  should validate_numericality_of :temperature
  should_not allow_value(neg).for(:temperature)
  should allow_value(nil).for(:temperature)
  should validate_numericality_of :amount
  should_not allow_value(neg).for(:amount)
  should allow_value(nil).for(:amount)
  
  context "A new instance of consultation" do
    should "copy patient.amount to amount if patient exists" do
      patient = Patient.new
      patient.stubs(:amount).returns(123)
      @new_record = true
      consultation = Consultation.new :patient => patient
      assert_equal 123, consultation.amount
    end
  end
end