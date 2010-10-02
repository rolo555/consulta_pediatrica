require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  should validate_presence_of :first_name
  should validate_presence_of :last_name
  should validate_presence_of :date_of_birth
  should validate_presence_of :consultation_price
  should validate_presence_of :place
  should validate_uniqueness_of(:first_name).scoped_to(:last_name, :date_of_birth).case_insensitive
  should_not allow_value(@long_string).for(:first_name)
  should_not allow_value(@long_string).for(:last_name)
  should_not allow_value(@long_string).for(:emails)
  should_not allow_value(@long_string).for(:mother)
  should_not allow_value(@long_string).for(:father)

  should have_many(:emails).dependent(:destroy)
  should have_many(:consultations).dependent(:destroy)
  should have_many(:family_records).dependent(:destroy)
  should have_many(:allergies).dependent(:destroy)
  should have_many(:addresses).dependent(:destroy)
  should have_many(:phone_numbers).dependent(:destroy)
  should have_many(:surgical_records).dependent(:destroy)
  should have_one(:pathological_records).dependent(:destroy)
  should have_one(:perinatal_record).dependent(:destroy)
  should belong_to(:place)
  should belong_to(:consultation_price)

  should "sanitizate first_name" do
    sanitizate("first_name")
  end

  should "sanitizate last_name" do
    sanitizate("last_name")
  end

  should "sanitizate mother" do
    sanitizate("mother")
  end

  should "sanitizate father" do
    sanitizate("father")
  end

  should "sanitizate referenced_by" do
    sanitizate("referenced_by")
  end

  should "to label" do
    patient = patients(:juan)
    patient.before_validation
    assert_equal("Juansito Pinto", patient.to_label)
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
end
