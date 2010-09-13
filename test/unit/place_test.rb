require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  should have_many(:patients)
  should validate_presence_of :city
  should validate_presence_of :country
  should validate_uniqueness_of(:city).scoped_to(:country).case_insensitive

  def test_to_label
    place = Place.new(:city => "city", :country => "country")
    assert_equal(place.to_label, "city country");
  end

  should "sanitizate city" do
    sanitizate("city")
  end

  should "sanitizate country" do
    sanitizate("country")
  end

end
