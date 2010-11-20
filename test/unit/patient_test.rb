require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  should validate_presence_of :first_name
  should validate_presence_of :last_name
  should validate_presence_of :date_of_birth
  should validate_presence_of :consultation_price
  should validate_presence_of :place
  should validate_uniqueness_of(:first_name).scoped_to(:last_name, :date_of_birth).case_insensitive
  
  should ensure_length_of(:first_name).is_at_most(50)
  should ensure_length_of(:last_name).is_at_most(50)
  should ensure_length_of(:mother).is_at_most(50)
  should ensure_length_of(:father).is_at_most(50)

  should_not allow_value(Date.tomorrow).for(:date_of_birth)

  should have_many(:emails).dependent(:destroy)
  should have_many(:consultations).dependent(:destroy)
  should have_many(:family_records).dependent(:destroy)
  should have_many(:allergies).dependent(:destroy)
  should have_many(:addresses).dependent(:destroy)
  should have_many(:phone_numbers).dependent(:destroy)
  should have_many(:surgical_records).dependent(:destroy)
  should have_many(:pathological_records).dependent(:destroy)
  should have_one(:perinatal_record).dependent(:destroy)
  should belong_to(:place)
  should belong_to(:consultation_price)

  valid_method_should_call_clean_whitespaces_of_all_strings Patient, [:photograph_content_type, :photograph_file_name]

  context 'to_label function' do
    should 'return first_name and last_name' do
      patient = Patient.new :first_name => 'Juansito', :last_name => 'Pinto'
      assert_equal 'Juansito Pinto', patient.to_label
    end
  end

  context "age" do
    should "be one day" do
      date = Date.today - 1
      patient = patients(:juan)
      patient.date_of_birth = date
      assert_equal("1 days", patient.age)
    end

    should "be empty" do
      date = Date.today
      patient = patients(:juan)
      patient.date_of_birth = date
      assert_equal("", patient.age)
    end

    should "be two days" do
      date = Date.today - 2
      patient = patients(:juan)
      patient.date_of_birth = date
      assert_equal("2 days", patient.age)
    end

    should "be two months" do
      date = Date.today << 2
      patient = patients(:juan)
      patient.date_of_birth = date
      assert_equal("2 months", patient.age)
    end

    should "be two years three months" do
      date = (Date.today << 24) << 3
      patient = patients(:juan)
      patient.date_of_birth = date
      assert_equal("2 years 3 months", patient.age)
    end

    should "be eleven months eight days" do
      date = (Date.today << 11) - 8
      patient = patients(:juan)
      patient.date_of_birth = date
      assert_equal("11 months 8 days", patient.age)
    end

    should "be two months ten days" do
      date = (Date.today << 2) - 10
      patient = patients(:juan)
      patient.date_of_birth = date
      assert_equal("2 months 10 days", patient.age)
    end

    should "be two years 6 months 1 days" do
      date = ((Date.today << 24) << 6) - 1
      patient = patients(:juan)
      patient.date_of_birth = date
      assert_equal("2 years 6 months 1 days", patient.age)
    end

    should "be two years 10 days" do
      date = (Date.today << 24) - 10
      patient = patients(:juan)
      patient.date_of_birth = date
      assert_equal("2 years 10 days", patient.age)
    end
  end

  context "clone_patient function" do
    should "call clone function" do
      patient = mock('patient', :first_name => 'Juansito')
      patient.expects(:clone).once
      patient.clone_patient
    end

    should "concat \"TWIN\" to first_name" do
      patient = Patient.new :first_name => 'Juansito'
      assert_equal 'Juansito TWIN', patient.clone_patient.first_name
    end

    should "set photograph to nil" do
      patient = Patient.new :first_name => ''
      assert_equal false, patient.clone_patient.photograph?
    end
  end

  context "amount function" do
    should "return consultation_price.amount if is present" do
      consultation_price = ConsultationPrice.new
      consultation_price.stubs(:present? => true, :amount => 999)
      patient = Patient.new(:consultation_price => consultation_price)
      assert_equal 999, patient.amount
    end

    should "return amount if consultation_price is not present" do
      consultation_price = ConsultationPrice.new
      consultation_price.stubs :present? => false, :amount => 999
      patient = Patient.new
      patient.stubs :consultation_price => consultation_price, :amount => 200
      assert_equal 200, patient.amount
    end
  end

  context "after create" do
    should "create a PerinatalRecord" do
      patient = patients :one
      patient.save
      assert_not_nil patient.perinatal_record
    end
  end
end
