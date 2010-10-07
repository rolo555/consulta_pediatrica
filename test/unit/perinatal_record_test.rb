require 'test_helper'
require 'mocha'

class PerinatalRecordTest < ActiveSupport::TestCase
  should belong_to :patient

  should_be_positive_integer_non_zero :number_of_pregnancy
  should_be_positive_integer :childbirth
  should_be_positive_integer :cesarea
  should_be_positive_integer :abortions
  should_be_positive_integer_non_zero :weeks_of_gestation
  should_be_positive_integer :apgar1
  should_be_positive_integer :apgar2

  should_be_positive_float :weight
  should_be_positive_float :height
  should_be_positive_float :head_circumference
  should_be_positive_float :body_perimeter

  should allow_value('1.5 kg').for(:weight)
  should allow_value('1500 gr').for(:weight)
  should allow_value('3.3 lb').for(:weight)

  should allow_value('12 in').for(:height)
  should allow_value('30 cm').for(:height)
  
  should "sanitizate number_of_pregnancy" do
    sanitizate "number_of_pregnancy"
  end

  should "sanitizate childbirth" do
    sanitizate "childbirth"
  end

  should "sanitizate cesarea" do
    sanitizate "cesarea"
  end

  should "sanitizate abortions" do
    sanitizate "abortions"
  end

  should "sanitizate weeks_of_gestation" do
    sanitizate "weeks_of_gestation"
  end

  should "sanitizate apgar1" do
    sanitizate "apgar1"
  end

  should "sanitizate apgar2" do
    sanitizate "apgar2"
  end

  should "sanitizate weight" do
    sanitizate "weight"
  end

  should "sanitizate height" do
    sanitizate "height"
  end

  should "sanitizate head_circumference" do
    sanitizate "head_circumference"
  end

  should "sanitizate body_perimeter" do
    sanitizate "body_perimeter"
  end

  context 'save' do
    should 'call function to_grams' do
      string = ""
      string.expects :to_grams
      perinatal_record = PerinatalRecord.new
      perinatal_record.weight = string
      perinatal_record.save
    end

    should 'call function to_cms' do
      string = ""
      string.expects :to_cms
      perinatal_record = PerinatalRecord.new
      perinatal_record.height = string
      perinatal_record.save
    end

    should 'save an empty record' do
      perinatal_record = PerinatalRecord.new
      assert_equal true, perinatal_record.save
    end
  end
end
