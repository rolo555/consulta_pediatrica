require 'test_helper'

class MedicalCertificateTest < ActiveSupport::TestCase
  should validate_presence_of :name
  should validate_presence_of :text
  should ensure_length_of(:name).is_at_most(50)
  should validate_uniqueness_of :name

  valid_method_should_call_clean_whitespaces_of_all_strings MedicalCertificate

  context 'to_label method' do
    should 'return name' do
      medical_certificate = MedicalCertificate.new :name => 'Fiebre'
      assert_equal 'Fiebre', medical_certificate.to_label
    end
  end
end
