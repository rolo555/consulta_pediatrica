require 'test_helper'
require 'mocha'

class PerinatalRecordTest < ActiveSupport::TestCase
  should belong_to :patient

  [:number_of_pregnancy, :childbirth, :cesarea, :abortions, :weeks_of_gestation,
  :apgar1, :apgar2].each do |field|
    should validate_numericality_of field
    should_not allow_value(-1).for field
    should_not allow_value(1.5).for field
    should allow_value(1).for field
    should allow_value(nil).for field
    should allow_value(0).for field
  end

  whuld_not allow_value(51).for :weeks_of_gestation
  
#  should_be_positive_float :weight
#  should_be_positive_float :height
  [:head_circumference, :body_perimeter].each do |field|
    should validate_numericality_of field
    should_not allow_value(-1).for field
    should allow_value(1.5).for field
    should allow_value(1).for field
    should allow_value(nil).for field
  end

#  should allow_value('1.5 kg').for(:weight)
#  should allow_value('1500 gr').for(:weight)
#  should allow_value('3.3 lb').for(:weight)
#
#  should allow_value('12 in').for(:height)
#  should allow_value('30 cm').for(:height)
  
  valid_method_should_call_clean_whitespaces_of_all_strings PerinatalRecord

#  context 'save' do
#    should 'call function to_grams' do
#      string = ""
#      string.expects :to_grams
#      perinatal_record = PerinatalRecord.new :weight => string
#      perinatal_record.save
#    end
#
#    should 'call function to_cms' do
#      string = ""
#      string.expects :to_cms
#      perinatal_record = PerinatalRecord.new
#      perinatal_record.height = string
#      perinatal_record.save
#    end
#
#    should 'save an empty record' do
#      perinatal_record = PerinatalRecord.new
#      assert_equal true, perinatal_record.save
#    end
#  end
end
