require 'test_helper'

class ApplicationRecordsHelperTest < ActionView::TestCase
  include ActiveScaffold::Helpers::AssociationHelpers
  include ApplicationRecordsHelper

  test "method options_for_association_conditions should return" do
    association = stub(:name => :vaccine)
    immunization_record = stub :vaccines_name_id => 999
    @record = stub :immunization_record => immunization_record
    r = Hash.new
    r = { 'vaccines.vaccines_name_id' => 999 }
    assert_equal r, options_for_association_conditions(association)
  end

  test "method options_for_association_conditions should return a" do
    association = stub 'association',
      :name => :vaccine,
      :options => {},
      :macro => nil
    @record = stub 'record', :immunization_record => nil
    assert_equal nil, options_for_association_conditions(association)
  end

end
