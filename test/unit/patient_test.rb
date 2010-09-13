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
  should belong_to(:patient_price)

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
end
