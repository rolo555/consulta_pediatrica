require 'test_helper'

class DrugTest < ActiveSupport::TestCase
  should validate_presence_of :name
  should validate_presence_of :recipe
  should ensure_length_of(:name).is_at_most(50)
  should validate_uniqueness_of :name
  #validates_numericality_of :how_often_in_hours, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 24, :if => "self.how_often_in_hours.presence"
  #validates_numericality_of :how_often_in_wight, :only_integer => true, :greater_than_or_equal_to => 0, :less_than_or_equal_to => 100,:if => "self.how_often_in_wight.presence"

  valid_method_should_call_clean_whitespaces_of_all_strings Drug

  context 'to_label method' do
    should 'return name' do
      drug = Drug.new :name => 'abc'
      assert_equal 'abc', drug.to_label
    end
  end
end
