require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  should have_many :patients
  should validate_presence_of :city
  should validate_presence_of :country
  should validate_uniqueness_of(:city).scoped_to(:country).case_insensitive
  should ensure_length_of(:city).is_at_most(50)
  should ensure_length_of(:country).is_at_most(50)

  context "to_label" do
    should "concat city and country" do
      place = places :one
      assert_equal place.to_label, "city country"
    end
  end

  should "sanitizate city" do
    sanitizate "city"
  end

  should "sanitizate country" do
    sanitizate "country"
  end
end
