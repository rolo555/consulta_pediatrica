class ApplicationRecordsController < ApplicationController
  active_scaffold :application_record do |conf|
    conf.columns = [:application_type, :date, :doctor_application, :vaccine]
    conf.columns[:application_type].form_ui = :select
    conf.columns[:application_type].options = {:options => [:dosis, :refuerzo]}
    conf.columns[:date].options = {:end_year => Date.today.year-30, :start_year => Date.today.year, :include_blank => true}
    conf.columns[:doctor_application].update_column = :vaccine_id
#    conf.columns[:doctor_application].update_column = :amount
    conf.columns[:doctor_application].send_form_on_update_column = true
    conf.columns[:doctor_application].form_ui = :boolean
  end
end
