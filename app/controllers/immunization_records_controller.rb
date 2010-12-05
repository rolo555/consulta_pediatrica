class ImmunizationRecordsController < ApplicationController

  active_scaffold :immunization_record do |conf|
    conf.columns = [:vaccines_name, :application_records]
    conf.columns[:vaccines_name].form_ui = :record_select
    conf.list.columns << :applications_records
    conf.list.columns.exclude :application_records
  end

end
