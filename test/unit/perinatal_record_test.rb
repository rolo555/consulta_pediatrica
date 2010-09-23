require 'test_helper'

class PerinatalRecordTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_numericality_of :number_of_pregnancy
  should validate_numericality_of :childbirth
  should validate_numericality_of :cesarea
  should validate_numericality_of :abortions
  should validate_numericality_of :weeks_of_gestation
  should validate_numericality_of :apgar1
  should validate_numericality_of :apgar2
  should validate_numericality_of :weight
  should validate_numericality_of :height
  should validate_numericality_of :head_circumference
  should validate_numericality_of :body_perimeter
  should allow_value(nil).for(:number_of_pregnancy)
  should allow_value(nil).for(:childbirth)
  should allow_value(nil).for(:cesarea)
  should allow_value(nil).for(:abortions)
  should allow_value(nil).for(:weeks_of_gestation)
  should allow_value(nil).for(:apgar1)
  should allow_value(nil).for(:apgar2)
  should allow_value(nil).for(:weight)
  should allow_value(nil).for(:height)
  should allow_value(nil).for(:head_circumference)
  should allow_value(nil).for(:body_perimeter)


  float = 0.5
  neg = -1
  should_not allow_value(float).for(:number_of_pregnancy)
  should_not allow_value(neg).for(:number_of_pregnancy)
  should_not allow_value(float).for(:childbirth)
  should_not allow_value(neg).for(:childbirth)
  should_not allow_value(float).for(:cesarea)
  should_not allow_value(neg).for(:cesarea)
  should_not allow_value(float).for(:abortions)
  should_not allow_value(neg).for(:abortions)
  should_not allow_value(float).for(:weeks_of_gestation)
  should_not allow_value(neg).for(:weeks_of_gestation)
  should_not allow_value(float).for(:apgar1)
  should_not allow_value(neg).for(:apgar1)
  should_not allow_value(float).for(:apgar2)
  should_not allow_value(neg).for(:apgar2)
  should_not allow_value(neg).for(:weight)
  should_not allow_value(neg).for(:height)
  should_not allow_value(neg).for(:head_circumference)
  should_not allow_value(neg).for(:body_perimeter)
end
