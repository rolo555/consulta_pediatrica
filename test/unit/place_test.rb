require 'test_helper'

class PlaceTest < ActiveSupport::TestCase
  should have_many :patients
  should validate_presence_of :city
  should validate_presence_of :country
  should validate_uniqueness_of(:city).scoped_to(:country).case_insensitive
  should ensure_length_of(:city).is_at_most(50)
  should ensure_length_of(:country).is_at_most(50)

  context "to_label" do
    should "return city and country" do
      place = Place.new :country => 'Tanganika', :city => '???'
      assert_equal '??? Tanganika', place.to_label
    end
  end

  valid_method_should_call_clean_whitespaces_of_all_strings Place
end
