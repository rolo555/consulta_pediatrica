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
        application_record = application_records :three
        application_record.after_save
      end
      assert_not_nil application_record.income
    end

    should "not create a Income if doctor_application is true and has income" do
      assert_difference("Income.count", 0) do
        application_record = application_records :one
        application_record.after_save
      end
    end

    should "not create a Income if doctor_application is false" do
      assert_difference("Income.count", 0) do
        application_record = ApplicationRecord.new :doctor_application => false
        application_record.after_create
      end
    end

    should "call update_income" do
      application_record = ApplicationRecord.new
      application_record.expects(:update_income)
      application_record.after_save
    end

    should "call update_vaccine" do
      application_record = ApplicationRecord.new :doctor_application => false
      application_record.expects(:update_vaccine)
      application_record.after_save
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
    should "not call vaccine.refund if vaccine doesn't changed" do
      application_record = application_records :one
      application_record.expects(:refund).never
      application_record.update_vaccine
    end

    should "not call vaccine.sell if vaccine doesn't changed" do
      application_record = application_records :one
      application_record.expects(:sell).never
      application_record.update_vaccine
    end

    should "call vaccine.sell if vaccine changed" do
      application_record = application_records :two
      application_record.vaccine = vaccines :one
      application_record.vaccine.expects(:sell)
      application_record.update_vaccine
    end

    should "call vaccine.refund for old_vaccine if vaccine changed" do
      application_record = application_records :one
      application_record.vaccine = nil
      Vaccine.any_instance.expects(:refund).once
      application_record.update_vaccine
    end
  end

  context "method destroy" do
    should "call vaccine.refund if doctor_application is true" do
      application_record = application_records :one
      application_record.vaccine.expects(:refund)
      application_record.destroy
    end

    should "not call vaccine.refund if doctor_application is false" do
      application_record = application_records :two
      Vaccine.any_instance.expects(:refund).never
      application_record.destroy
    end
  end

  context "new record" do
    should "set doctor_application in true" do
      assert ApplicationRecord.new.doctor_application
    end
  end

end
