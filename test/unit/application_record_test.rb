require 'test_helper'

class ApplicationRecordTest < ActiveSupport::TestCase

  should belong_to :immunization_record
  should belong_to :vaccine
  should have_one(:income).dependent(:destroy)

  should validate_presence_of :date
  should validate_presence_of :application_type

  context "method validate_presence_of vaccine" do
    should "add an error if doctor_application is true" do
      application_record = ApplicationRecord.new :doctor_application => true
      assert_bad_value application_record, :vaccine, nil, "no puede estar en blanco"
    end

    should "not add an error if doctor_application is false" do
      application_record = ApplicationRecord.new :doctor_application => false
      assert_good_value application_record, :vaccine, nil, "no puede estar en blanco"
    end

    should "not add an error if doctor_application is true and there is a vaccine" do
      application_record = ApplicationRecord.new :doctor_application => true
      assert_good_value application_record, :vaccine, Vaccine.new, "no puede estar en blanco"
    end 
  end

  context "method validate_date" do
    should "add an error if date is greater than today" do
      assert_bad_value  ApplicationRecord, :date, Date.tomorrow, "#{as_('can\'t be greater than')} #{as_('today')}"
    end

    should "not add an error if date is lower than today" do
      assert_good_value  ApplicationRecord, :date, Date.yesterday, "#{as_('can\'t be greater than')} #{as_('today')}"
    end

    should "not add an error if date is today" do
      assert_good_value  ApplicationRecord, :date, Date.today, "#{as_('can\'t be greater than')} #{as_('today')}"
    end
  end

  context "method validate_vaccine" do
    should "add an error if doctor application is false and there is a vaccine" do
      application_record = ApplicationRecord.new :doctor_application => false
      assert_bad_value application_record, :vaccine, Vaccine.new, "#{as_('must be empty unless is a doctor application')}"
    end

    should "not add an error if doctor application is true and there is a vaccine" do
      application_record = ApplicationRecord.new :doctor_application => true
      assert_good_value application_record, :vaccine, Vaccine.new, "#{as_('must be empty unless is a doctor application')}"
    end
  end

  context 'to_label function' do
    should 'return application_type and date' do
      application_record = ApplicationRecord.new :application_type => 'test', :date => Date.new(2005, 10, 30)
      assert_equal 'test del 30 de Octubre de 2005', application_record.to_label
    end
  end

  context "after save" do
    should "create a Income if doctor_application is true and income is nil" do
      application_record = nil
      assert_difference("Income.count") do
        application_record = ApplicationRecord.new :doctor_application => true
        application_record.after_save
      end
      assert_not_nil application_record.income
    end

    should "not create a Income if doctor_application is true and has income" do
      assert_difference("Income.count", 0) do
        application_record = ApplicationRecord.new :doctor_application => true,
          :income => Income.new
        application_record.after_save
      end
    end

    should "not create a Income if doctor_application is false" do
      assert_difference("Income.count", 0) do
        application_record = ApplicationRecord.new :doctor_application => false
        application_record.after_create
      end
    end
  end

  context "method update_income" do
    should "update income.concept with vaccine_name and patient_name" do
      application_record = application_records :one
      application_record.update_income
      assert_equal "Aplicación de Complejo B a Juansito Pinto", application_record.income.concept
    end

    should "update income.amount with vaccine.calculate_profit" do
      application_record = application_records :one
      application_record.update_income
      assert_equal 10.0, application_record.income.amount
    end
    
    should "don't change income" do
      application_record = application_records :two
      application_record.update_income
      assert_nil application_record.income
    end
  end

  context "update_vaccine" do
    should "not change vaccine.units if vaccine doesn't changed" do
      application_record = application_records :one
      assert_difference "application_record.vaccine.units", 0 do
        application_record.update_vaccine
      end
    end

    should "decrease vaccine.units if vaccine was nil" do
      application_record = application_records :two
      application_record.vaccine = vaccines :one
      assert_difference "application_record.vaccine.units", -1 do
        application_record.update_vaccine
      end
    end

    should "increase vaccine.units for old_vaccine" do
      application_record = application_records :one
      old_vaccine = application_record.vaccine
      application_record.vaccine = vaccines :two
      assert_difference "old_vaccine.units", 1 do
        application_record.update_vaccine
      end
    end
  end
end
