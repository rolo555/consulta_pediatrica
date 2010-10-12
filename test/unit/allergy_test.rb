require 'test_helper'

class AllergyTest < ActiveSupport::TestCase
  should belong_to :patient
  should validate_presence_of :substance
  should validate_presence_of :reaction
  should validate_uniqueness_of(:substance).case_insensitive
  should ensure_length_of(:substance).is_at_most(50)
  should ensure_length_of(:reaction).is_at_most(50)

  should "sanitizate substance" do
    sanitizate "substance"
  end

  should "sanitizate reaction" do
    sanitizate "reaction"
  end

  def test_to_label
    allergy = Allergy.new(:substance => "Substance")
    assert_equal(allergy.to_label, "Substance");
  end

end
