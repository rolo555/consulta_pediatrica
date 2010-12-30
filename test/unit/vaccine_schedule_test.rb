require 'test_helper'
require 'mocha'

class VaccineScheduleTest < ActiveSupport::TestCase
  should validate_presence_of :vaccines_name
  should validate_presence_of :application_type
  should validate_presence_of :days

  should belong_to :vaccines_name

  context 'to label' do
    should 'return [number] [application type] [days]' do
      vaccine_schedule = VaccineSchedule.new
      vaccine_schedule.stubs(:number => "Primera", :application_type => "Dosis", :days => 10)
      assert_equal "Primera Dosis a los 10 días", vaccine_schedule.to_label
    end
  end

  context 'number method' do
    should 'return Primera if is the first dosis' do
      vaccine_schedule = VaccineSchedule.new
      vaccines_name = VaccinesName.new
      vaccine_schedule.stubs(:vaccines_name => vaccines_name, :id => 10, :application_type => "Dosis")
      VaccineSchedule.stubs(:find_all_by_vaccines_name_id_and_application_type).returns([10])
      assert_equal as_(:dosis)[1], vaccine_schedule.number
    end

    should 'return Tercera if is the third dosis' do
      vaccine_schedule = VaccineSchedule.new
      vaccines_name = VaccinesName.new
      VaccineSchedule.stubs(:find_all_by_vaccines_name_id_and_application_type).returns([nil, nil, 10, nil])
      vaccine_schedule.stubs(:vaccines_name => vaccines_name, :id => 10, :application_type => "Dosis")
      assert_equal as_(:dosis)[3], vaccine_schedule.number
    end

    should 'return Primer if is the first refuerzo' do
      vaccine_schedule = VaccineSchedule.new
      vaccines_name = VaccinesName.new
      vaccine_schedule.stubs(:vaccines_name => vaccines_name, :id => 10, :application_type => "Refuerzo")
      VaccineSchedule.stubs(:find_all_by_vaccines_name_id_and_application_type).returns([10])
      assert_equal as_(:refuerzos)[1], vaccine_schedule.number
    end

    should 'return Tercera if is the third refuerzo' do
      vaccine_schedule = VaccineSchedule.new
      vaccines_name = VaccinesName.new
      VaccineSchedule.stubs(:find_all_by_vaccines_name_id_and_application_type).returns([nil, nil, 10, nil])
      vaccine_schedule.stubs(:vaccines_name => vaccines_name, :id => 10, :application_type => "Refuerzo")
      assert_equal as_(:refuerzos)[3], vaccine_schedule.number
    end
  end

end
