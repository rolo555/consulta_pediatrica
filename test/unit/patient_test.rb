require 'test_helper'

class PatientTest < ActiveSupport::TestCase
  should validate_presence_of :first_name
  should validate_presence_of :last_name
  should validate_presence_of :date_of_birth
  should validate_uniqueness_of(:first_name).scoped_to(:last_name, :date_of_birth).case_insensitive

  should have_many(:emails).dependent(:destroy)
  should have_many(:consultations).dependent(:destroy)
  should have_many(:addresses).dependent(:destroy)
  should have_many(:phone_numbers).dependent(:destroy)
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
    assert_equal(patient.to_label, "Juansito Pinto")
  end

  should "two days of age" do
    date = Date.today - 1
    patient = patients(:juan)
    patient.date_of_birth = date
    assert_equal(patient.age, "2 days")
  end

  should "two months of age" do
    date = Date.today << 2
    patient = patients(:juan)
    patient.date_of_birth = date
    assert_equal(patient.age, "2 months")
  end

  should "two years of age" do
    date = Date.today << 24
    patient = patients(:juan)
    patient.date_of_birth = date
    assert_equal(patient.age, "2 years")
  end

end
