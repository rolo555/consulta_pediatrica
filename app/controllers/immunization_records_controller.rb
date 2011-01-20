class ImmunizationRecordsController < ApplicationController
  active_scaffold :immunization_record do |conf|
    conf.columns = [:vaccines_name]
    conf.columns[:vaccines_name].form_ui = :record_select
    conf.list.columns << :application_records
    conf.show.columns << :application_records_resume
  end
end
